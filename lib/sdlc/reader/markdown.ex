defmodule Sdlc.Reader.Markdown do
  @moduledoc """
  Converts HTML into bounded CommonMark and GitHub Flavored Markdown.

  The converter walks the Floki tree from the leaves to the root. Ordered
  custom rules can replace normal elements. Unsafe and non-content elements
  remain excluded and cannot be restored by a custom rule.
  """

  alias Sdlc.Reader.{Rule, URL}

  @ignored_tags ~w(
    script style noscript template form input button select option textarea
    fieldset object embed iframe canvas svg head title meta link base
  )
  @container_tags ~w(html body main article section div header footer figure figcaption
                     address center nav aside details dialog summary)
  @lazy_image_attributes ~w(data-src data-original data-lazy-src data-url data-srcset src srcset)
  @safe_schemes ~w(http https mailto)

  @type option :: {:base_url, String.t()} | {:rules, [Rule.t()]}

  @doc """
  Converts an HTML document or fragment to Markdown.

  `:base_url` resolves relative links and image sources. `:rules` accepts
  ordered `Sdlc.Reader.Rule` values. The first matching custom rule wins.
  """
  @spec convert(String.t(), [option()]) :: {:ok, String.t()} | {:error, term()}
  def convert(html, options \\ [])

  def convert(html, options) when is_binary(html) and is_list(options) do
    with {:ok, rules} <- validate_rules(Keyword.get(options, :rules, [])),
         {:ok, nodes} <- Floki.parse_fragment(html) do
      context = %{
        base_url: Keyword.get(options, :base_url),
        rules: rules,
        parent: nil,
        in_code: false,
        list_depth: 0
      }

      markdown =
        nodes
        |> render_nodes(context)
        |> normalize_document()

      {:ok, markdown}
    end
  end

  def convert(_html, _options), do: {:error, :invalid_input}

  defp validate_rules(rules) when is_list(rules) do
    if Enum.all?(rules, &match?(%Rule{}, &1)), do: {:ok, rules}, else: {:error, :invalid_rules}
  end

  defp validate_rules(_rules), do: {:error, :invalid_rules}

  defp render_nodes(nodes, context) do
    nodes
    |> Enum.map_join(&render_node(&1, context))
  end

  defp render_node(text, %{in_code: true}) when is_binary(text), do: text

  defp render_node(text, _context) when is_binary(text) do
    text
    |> String.replace(~r/[\t\n\r ]+/u, " ")
    |> escape_text()
  end

  defp render_node({:comment, _comment}, _context), do: ""
  defp render_node({:pi, _name, _attributes}, _context), do: ""
  defp render_node({:doctype, _name, _public, _system}, _context), do: ""

  defp render_node({tag, _attributes, _children}, _context) when tag in @ignored_tags, do: ""

  defp render_node({tag, attributes, children}, context) do
    tag = String.downcase(tag)
    node = {tag, attributes, children}
    child_context = %{context | parent: tag}

    case matching_rule(context.rules, node, context) do
      nil ->
        cond do
          tag == "pre" ->
            render_pre(node)

          tag in ["ul", "ol"] ->
            render_list(node, context)

          tag == "table" ->
            render_table(node, context)

          true ->
            content = render_nodes(children, child_context)
            built_in_replacement(tag, attributes, content, node, context)
        end

      rule ->
        content_context =
          if tag == "pre", do: %{child_context | in_code: true}, else: child_context

        content = render_nodes(children, content_context)
        apply_custom_rule(rule, content, node, context)
    end
  end

  defp render_node(_node, _context), do: ""

  defp matching_rule(rules, node, context) do
    Enum.find(rules, &rule_matches?(&1.filter, node, context))
  end

  defp apply_custom_rule(rule, content, node, context) do
    replacement = rule.replacement.(content, node, context)

    unless is_binary(replacement) do
      raise ArgumentError, "custom Markdown rule #{inspect(rule.name)} returned a non-string"
    end

    replacement
  end

  defp rule_matches?(filter, {tag, _attributes, _children}, _context)
       when is_binary(filter) or is_atom(filter) do
    tag == filter |> to_string() |> String.downcase()
  end

  defp rule_matches?(filters, node, context) when is_list(filters) do
    Enum.any?(filters, &rule_matches?(&1, node, context))
  end

  defp rule_matches?(filter, node, _context) when is_function(filter, 1), do: filter.(node)

  defp rule_matches?(filter, node, context) when is_function(filter, 2),
    do: filter.(node, context)

  defp built_in_replacement(tag, _attributes, content, _node, _context)
       when tag in @container_tags,
       do: block(content)

  defp built_in_replacement("p", _attributes, content, _node, _context), do: block(content)

  defp built_in_replacement(tag, _attributes, content, _node, _context)
       when tag in ~w(strong b),
       do: wrap_inline(content, "**")

  defp built_in_replacement(tag, _attributes, content, _node, _context)
       when tag in ~w(em i),
       do: wrap_inline(content, "*")

  defp built_in_replacement(tag, _attributes, content, _node, _context)
       when tag in ~w(del s strike),
       do: wrap_inline(content, "~~")

  defp built_in_replacement("code", _attributes, content, _node, _context),
    do: inline_code(content)

  defp built_in_replacement("br", _attributes, _content, _node, _context), do: "\\\n"
  defp built_in_replacement("hr", _attributes, _content, _node, _context), do: "\n\n---\n\n"

  defp built_in_replacement("blockquote", _attributes, content, _node, _context) do
    quoted =
      content
      |> trim_block()
      |> String.split("\n", trim: false)
      |> Enum.map_join("\n", fn
        "" -> ">"
        line -> "> " <> line
      end)

    block(quoted)
  end

  defp built_in_replacement("a", attributes, content, _node, context) do
    label = trim_inline(content)
    title = present_attribute(attributes, "title")

    case safe_url(attribute(attributes, "href"), context.base_url) do
      nil -> label
      destination when label == "" -> destination
      destination -> link_markdown(label, destination, title)
    end
  end

  defp built_in_replacement("img", attributes, _content, _node, context) do
    case image_source(attributes, context.base_url) do
      nil -> escape_alt(attribute(attributes, "alt") || "")
      destination -> image_markdown(attributes, destination)
    end
  end

  defp built_in_replacement(tag, _attributes, content, _node, _context)
       when tag in ~w(h1 h2 h3 h4 h5 h6) do
    level = tag |> String.trim_leading("h") |> String.to_integer()
    block(String.duplicate("#", level) <> " " <> trim_inline(content))
  end

  defp built_in_replacement("sub", _attributes, content, _node, _context),
    do: "<sub>#{trim_inline(content)}</sub>"

  defp built_in_replacement("sup", _attributes, content, _node, _context),
    do: "<sup>#{trim_inline(content)}</sup>"

  defp built_in_replacement(_tag, _attributes, content, _node, _context), do: content

  defp render_pre({"pre", _attributes, children}) do
    {language, code} = pre_content(children)
    code = code |> String.replace("\r\n", "\n") |> String.trim("\n")
    fence = String.duplicate("`", max(3, longest_run(code, ?`) + 1))
    info = if language, do: language, else: ""
    "\n\n#{fence}#{info}\n#{code}\n#{fence}\n\n"
  end

  defp pre_content([{"code", attributes, children} | _]) do
    {code_language(attributes), plain_text(children)}
  end

  defp pre_content(children), do: {nil, plain_text(children)}

  defp code_language(attributes) do
    classes = attribute(attributes, "class") || ""

    classes
    |> String.split()
    |> Enum.find_value(fn class ->
      cond do
        String.starts_with?(class, "language-") -> String.trim_leading(class, "language-")
        String.starts_with?(class, "lang-") -> String.trim_leading(class, "lang-")
        true -> nil
      end
    end)
    |> safe_info_string()
  end

  defp safe_info_string(nil), do: nil

  defp safe_info_string(language) do
    case Regex.run(~r/^[A-Za-z0-9_+.-]+/u, language) do
      [safe] -> safe
      _ -> nil
    end
  end

  defp inline_code(content) do
    content = content |> unescape_markdown() |> String.replace(~r/\s+/u, " ")

    if content == "" do
      ""
    else
      delimiter = String.duplicate("`", max(1, longest_run(content, ?`) + 1))

      padding =
        if String.length(delimiter) > 1 or String.starts_with?(content, ["`", " "]) or
             String.ends_with?(content, ["`", " "]) do
          " "
        else
          ""
        end

      "#{delimiter}#{padding}#{content}#{padding}#{delimiter}"
    end
  end

  defp render_list({tag, attributes, children}, context) do
    items = Enum.filter(children, &match?({"li", _, _}, &1))
    start = if tag == "ol", do: integer_attribute(attributes, "start", 1), else: 1

    rendered =
      items
      |> Enum.with_index(start)
      |> Enum.map_join("\n", fn {item, number} ->
        marker = if tag == "ol", do: "#{number}.", else: "-"
        render_list_item(item, marker, %{context | list_depth: context.list_depth + 1})
      end)

    block(rendered)
  end

  defp render_list_item({"li", _attributes, children}, marker, context) do
    {nested_lists, ordinary_children} =
      Enum.split_with(children, fn
        {tag, _attributes, _children} when tag in ["ul", "ol"] -> true
        _node -> false
      end)

    ordinary = ordinary_children |> render_nodes(%{context | parent: "li"}) |> trim_block()
    marker_prefix = marker <> " "
    continuation = String.duplicate(" ", String.length(marker_prefix))

    first_part =
      ordinary
      |> String.split("\n", trim: false)
      |> Enum.with_index()
      |> Enum.map_join("\n", fn
        {line, 0} -> marker_prefix <> line
        {line, _index} -> continuation <> line
      end)

    nested =
      nested_lists
      |> Enum.map_join(fn list ->
        list
        |> render_node(context)
        |> trim_block()
        |> indent_lines(continuation)
        |> then(&("\n" <> &1))
      end)

    first_part <> nested
  end

  defp render_table({"table", _attributes, children}, context) do
    rows = collect_rows(children)

    case rows do
      [] ->
        ""

      [first | rest] ->
        header = render_table_row(first, context)
        width = max(length(header), rows |> Enum.map(&table_cell_count/1) |> Enum.max())
        header = pad_row(header, width)
        separator = List.duplicate("---", width)

        body =
          rest
          |> Enum.map(&(&1 |> render_table_row(context) |> pad_row(width)))

        ([header, separator] ++ body)
        |> Enum.map_join("\n", &table_line/1)
        |> block()
    end
  end

  defp collect_rows(nodes) do
    Enum.flat_map(nodes, fn
      {"tr", _attributes, _children} = row ->
        [row]

      {tag, _attributes, children} when tag in ["thead", "tbody", "tfoot"] ->
        collect_rows(children)

      _node ->
        []
    end)
  end

  defp table_cell_count({"tr", _attributes, children}) do
    Enum.count(children, &match?({tag, _, _} when tag in ["th", "td"], &1))
  end

  defp render_table_row({"tr", _attributes, children}, context) do
    children
    |> Enum.flat_map(fn
      {tag, _attributes, cell_children} when tag in ["th", "td"] ->
        cell =
          cell_children
          |> render_nodes(%{context | parent: tag})
          |> trim_block()
          |> String.replace(~r/\s*\n+\s*/u, "<br>")
          |> String.replace("|", "\\|")

        [cell]

      _node ->
        []
    end)
  end

  defp table_line(cells), do: "| " <> Enum.join(cells, " | ") <> " |"
  defp pad_row(row, width), do: row ++ List.duplicate("", max(width - length(row), 0))

  defp link_markdown(label, destination, nil) do
    "[#{label}](#{escape_destination(destination)})"
  end

  defp link_markdown(label, destination, title) do
    ~s|[#{label}](#{escape_destination(destination)} "#{escape_title(title)}")|
  end

  defp image_markdown(attributes, destination) do
    alt = escape_alt(attribute(attributes, "alt") || "")
    title = present_attribute(attributes, "title")
    destination = escape_destination(destination)

    case title do
      nil -> "![#{alt}](#{destination})"
      value -> "![#{alt}](#{destination} \"#{escape_title(value)}\")"
    end
  end

  defp image_source(attributes, base_url) do
    Enum.find_value(@lazy_image_attributes, fn name ->
      source =
        attributes
        |> present_attribute(name)
        |> srcset_candidate(name)
        |> safe_url(base_url)

      case URI.parse(source || "") do
        %URI{scheme: scheme} when scheme in ["http", "https"] -> source
        _ -> nil
      end
    end)
  end

  defp srcset_candidate(nil, _name), do: nil

  defp srcset_candidate(value, name) when name in ["data-srcset", "srcset"] do
    value
    |> String.split(",", parts: 2)
    |> List.first()
    |> String.trim()
    |> String.split(~r/\s+/u, parts: 2)
    |> List.first()
  end

  defp srcset_candidate(value, _name), do: value

  defp plain_text(nodes) do
    Enum.map_join(nodes, fn
      text when is_binary(text) -> text
      {_tag, _attributes, children} -> plain_text(children)
      _node -> ""
    end)
  end

  defp longest_run(text, character) do
    text
    |> String.to_charlist()
    |> Enum.reduce({0, 0}, fn
      ^character, {current, longest} -> {current + 1, max(current + 1, longest)}
      _other, {_current, longest} -> {0, longest}
    end)
    |> elem(1)
  end

  defp safe_url(nil, _base_url), do: nil
  defp safe_url("", _base_url), do: nil

  defp safe_url(destination, base_url) do
    destination = String.trim(destination)

    with false <- destination == "",
         false <- String.match?(destination, ~r/[\x{0000}-\x{001F}\x{007F}]/u),
         {:ok, resolved} <- resolve_url(destination, base_url),
         %URI{scheme: scheme, host: host} <- URI.parse(resolved),
         scheme when is_binary(scheme) <- scheme,
         scheme = String.downcase(scheme),
         true <- scheme in @safe_schemes,
         true <- scheme == "mailto" or (is_binary(host) and host != ""),
         {:ok, safe} <- validate_resolved_url(scheme, resolved) do
      safe
    else
      _failure -> nil
    end
  rescue
    URI.Error -> nil
  end

  defp validate_resolved_url("mailto", resolved), do: {:ok, resolved}

  defp validate_resolved_url(_scheme, resolved) do
    case URL.validate(resolved) do
      {:ok, uri} -> {:ok, URI.to_string(uri)}
      {:error, _reason} -> :error
    end
  end

  defp resolve_url(destination, base_url) do
    uri = URI.parse(destination)

    cond do
      uri.scheme ->
        {:ok, destination}

      is_binary(base_url) and base_url != "" ->
        {:ok, base_url |> URI.merge(destination) |> URI.to_string()}

      true ->
        :error
    end
  end

  defp escape_destination(destination) do
    destination
    |> String.replace("\\", "%5C")
    |> String.replace("(", "%28")
    |> String.replace(")", "%29")
    |> String.replace(~r/[\s<>]/u, fn value -> URI.encode(value) end)
  end

  defp escape_text(text) do
    escaped_backslashes = String.replace(text, "\\", "\\\\")

    escaped_inline =
      Regex.replace(~r/([`*_\[\]<>])/u, escaped_backslashes, fn _match, character ->
        "\\" <> character
      end)

    Regex.replace(~r/^(\#{1,6}|[>+-](?=\s)|\d+[.)](?=\s))/u, escaped_inline, fn match ->
      "\\" <> match
    end)
  end

  defp escape_alt(nil), do: ""

  defp escape_alt(text) do
    text
    |> String.replace("\\", "\\\\")
    |> String.replace("[", "\\[")
    |> String.replace("]", "\\]")
    |> String.replace(~r/\s+/u, " ")
    |> String.trim()
  end

  defp escape_title(text) do
    text
    |> String.replace("\\", "\\\\")
    |> String.replace("\"", "\\\"")
    |> String.replace(~r/\s+/u, " ")
    |> String.trim()
  end

  defp unescape_markdown(text) do
    Regex.replace(~r/\\([`*_\[\]<>\\])/u, text, fn _match, character -> character end)
  end

  defp attribute(attributes, name) when is_map(attributes), do: Map.get(attributes, name)
  defp attribute(attributes, name), do: List.keyfind(attributes, name, 0, {name, nil}) |> elem(1)

  defp present_attribute(attributes, name) do
    case attribute(attributes, name) do
      value when is_binary(value) -> if String.trim(value) == "", do: nil, else: value
      _value -> nil
    end
  end

  defp integer_attribute(attributes, name, default) do
    case Integer.parse(attribute(attributes, name) || "") do
      {value, ""} when value > 0 -> value
      _failure -> default
    end
  end

  defp wrap_inline(content, delimiter) do
    case trim_inline(content) do
      "" -> ""
      value -> delimiter <> value <> delimiter
    end
  end

  defp trim_inline(content), do: String.trim(content)
  defp trim_block(content), do: String.trim(content)

  defp block(content) do
    case trim_block(content) do
      "" -> ""
      value -> "\n\n" <> value <> "\n\n"
    end
  end

  defp indent_lines(content, indentation) do
    content
    |> String.split("\n", trim: false)
    |> Enum.map_join("\n", &(indentation <> &1))
  end

  defp normalize_document(markdown) do
    markdown
    |> String.replace(~r/[ \t]+\n/u, "\n")
    |> String.replace(~r/\n{3,}/u, "\n\n")
    |> String.trim()
    |> case do
      "" -> ""
      value -> value <> "\n"
    end
  end
end
