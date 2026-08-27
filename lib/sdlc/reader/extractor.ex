defmodule Sdlc.Reader.Extractor do
  @moduledoc false

  @chrome_tags ~w(
    script style noscript template iframe object embed form input button select textarea
    nav footer aside dialog canvas svg
  )

  @negative_hints ~w(
    ad ads advert advertisement banner promo promoted promotion sponsor sponsored
    interlude pswp-caption author-bio author-mini-bio
    subscribe subscription newsletter social share sharing comment comments discussion
    related recommendation recommended sidebar navigation menu breadcrumb cookie consent
    paywall modal popup toolbar pagination footer
  )

  @positive_hints ~w(
    article articlebody article-body article-content story story-body post post-content
    entry entry-content content-body main-content prose
  )

  @lazy_image_attributes ~w(data-src data-lazy-src data-original data-image-src)
  @tracking_image_pattern ~r/(?:tracking|pixel|spacer|blank|placeholder)\.(?:gif|png|jpg|jpeg)(?:\?|$)/i

  @type html_node :: Floki.html_node()

  @spec content(Floki.html_tree()) :: {:ok, html_node()} | {:error, :no_readable_content}
  def content(tree) do
    tree = sanitize(tree)

    (select_best(semantic_candidates(tree)) || select_best(generic_candidates(tree)))
    |> case do
      {node, _score} -> {:ok, node}
      nil -> {:error, :no_readable_content}
    end
  end

  @spec metadata(Floki.html_tree(), html_node() | nil) :: map()
  def metadata(tree, selected_node) do
    %{
      title:
        first_attribute(tree, ~s(meta[property="og:title"]), "content") ||
          first_attribute(tree, ~s(meta[name="twitter:title"]), "content") ||
          selected_heading(selected_node) || first_text(tree, "title"),
      byline:
        first_attribute(tree, ~s(meta[name="author"]), "content") ||
          first_attribute(tree, ~s(meta[property="article:author"]), "content") ||
          first_text(tree, ~s([rel="author"], .byline, .author)),
      excerpt:
        first_attribute(tree, ~s(meta[name="description"]), "content") ||
          first_attribute(tree, ~s(meta[property="og:description"]), "content"),
      language: first_attribute(tree, "html", "lang"),
      published_at: published_at(tree, selected_node)
    }
    |> Map.new(fn
      {:published_at, value} -> {:published_at, value}
      {key, value} -> {key, normalize_text(value)}
    end)
  end

  @spec sanitize(Floki.html_tree()) :: Floki.html_tree()
  def sanitize(nodes) when is_list(nodes) do
    nodes
    |> Enum.reduce([], fn node, cleaned ->
      case sanitize_node(node) do
        nil -> cleaned
        sanitized -> [sanitized | cleaned]
      end
    end)
    |> Enum.reverse()
  end

  defp sanitize_node({tag, attributes, children}) do
    if remove_node?(tag, attributes) do
      nil
    else
      {tag, normalize_image_attributes(tag, attributes), sanitize(children)}
    end
  end

  defp sanitize_node(node), do: node

  defp remove_node?(tag, attributes) do
    tag in @chrome_tags or
      (tag not in ["html", "body"] and (negative_hint?(attributes) or hidden?(attributes)))
  end

  defp hidden?(attributes) do
    aria_hidden = attribute(attributes, "aria-hidden") == "true"
    hidden_attribute = attribute(attributes, "hidden") != nil
    hidden_class = attributes |> attribute("class") |> class_token?("hidden")
    hidden_style = attributes |> attribute("style") |> hidden_style?()

    aria_hidden or hidden_attribute or hidden_class or hidden_style
  end

  defp class_token?(nil, _token), do: false
  defp class_token?(value, token), do: token in String.split(value)

  defp hidden_style?(nil), do: false

  defp hidden_style?(value) do
    String.match?(value, ~r/(?:display\s*:\s*none|visibility\s*:\s*hidden)/i)
  end

  defp normalize_image_attributes("img", attributes) do
    source = attribute(attributes, "src")

    lazy_source =
      Enum.find_value(@lazy_image_attributes, fn name ->
        attributes |> attribute(name) |> non_empty_value()
      end)

    if usable_image_source?(source) or is_nil(lazy_source) do
      attributes
    else
      put_attribute(attributes, "src", lazy_source)
    end
  end

  defp normalize_image_attributes(_tag, attributes), do: attributes

  defp usable_image_source?(nil), do: false

  defp usable_image_source?(source),
    do:
      source
      |> String.trim()
      |> then(&(&1 != "" and not Regex.match?(@tracking_image_pattern, &1)))

  defp semantic_candidates(tree),
    do: find_all(tree, ["article", "main", ~s([role="main"]), ~s([itemprop="articleBody"])])

  defp generic_candidates(tree), do: find_all(tree, ["section", "div"])

  defp select_best(candidates) do
    candidates
    |> Enum.uniq()
    |> Enum.map(&score/1)
    |> Enum.reject(&(elem(&1, 1) < minimum_score(elem(&1, 0))))
    |> Enum.max_by(&elem(&1, 1), fn -> nil end)
  end

  defp find_all(tree, selectors), do: Enum.flat_map(selectors, &Floki.find(tree, &1))

  defp score({tag, attributes, _children} = node) do
    useful_text = text(node)
    text_length = String.length(useful_text)
    paragraphs = count(node, "p")
    headings = count(node, "h1, h2, h3")
    images = count(node, "img")
    links = Floki.find(node, "a") |> Enum.map(&text/1) |> Enum.join(" ") |> String.length()
    link_density = if text_length == 0, do: 1.0, else: links / text_length

    semantic_bonus = if tag in ["article", "main"] or semantic_main?(attributes), do: 220, else: 0
    positive_bonus = positive_hint_count(attributes) * 100
    prose_score = min(text_length, 2_000) / 8 + paragraphs * 95 + headings * 40 + images * 25
    link_penalty = round(link_density * 260)

    {node, round(prose_score + semantic_bonus + positive_bonus - link_penalty)}
  end

  defp minimum_score({tag, attributes, _children}) do
    if tag in ["article", "main"] or semantic_main?(attributes), do: 180, else: 260
  end

  defp semantic_main?(attributes) do
    attribute(attributes, "role") == "main" or attribute(attributes, "itemprop") == "articleBody"
  end

  defp count(node, selector), do: node |> Floki.find(selector) |> length()

  defp selected_heading(nil), do: nil

  defp selected_heading(node) do
    first_text([node], "h1") || first_text([node], "h2")
  end

  defp first_attribute(tree, selector, name) do
    tree
    |> Floki.attribute(selector, name)
    |> List.first()
  end

  defp first_text(tree, selector) do
    tree
    |> Floki.find(selector)
    |> List.first()
    |> case do
      nil -> nil
      node -> text(node)
    end
  end

  defp published_at(tree, selected_node) do
    value =
      first_attribute(tree, ~s(meta[property="article:published_time"]), "content") ||
        first_attribute(tree, ~s(meta[name="date"]), "content") ||
        first_attribute(tree, ~s(meta[itemprop="datePublished"]), "content") ||
        first_attribute(List.wrap(selected_node), "time[datetime]", "datetime")

    parse_date(value)
  end

  defp parse_date(value) when is_binary(value) do
    with [date] <- Regex.run(~r/^\d{4}-\d{2}-\d{2}/, String.trim(value), capture: :first),
         {:ok, parsed} <- Date.from_iso8601(date) do
      parsed
    else
      _ -> nil
    end
  end

  defp parse_date(_value), do: nil

  defp text(node), do: node |> Floki.text(sep: " ") |> normalize_text()

  defp normalize_text(nil), do: nil

  defp normalize_text(value),
    do: value |> String.replace(~r/\s+/u, " ") |> String.trim() |> non_empty_value()

  defp non_empty_value(nil), do: nil
  defp non_empty_value(""), do: nil
  defp non_empty_value(value), do: value

  defp negative_hint?(attributes) do
    attributes
    |> identifiers()
    |> Enum.any?(&contains_hint?(&1, @negative_hints))
  end

  defp positive_hint_count(attributes) do
    attributes
    |> identifiers()
    |> Enum.count(&contains_hint?(&1, @positive_hints))
  end

  defp identifiers(attributes) do
    [attribute(attributes, "class"), attribute(attributes, "id")]
    |> Enum.reject(&is_nil/1)
    |> Enum.map(&String.downcase/1)
  end

  defp contains_hint?(value, hints) do
    tokens = String.split(value, ~r/[^a-z0-9]+/u, trim: true)

    Enum.any?(hints, fn hint ->
      hint in tokens or (String.length(hint) > 3 and String.contains?(value, hint))
    end)
  end

  defp attribute(attributes, name),
    do: Enum.find_value(attributes, fn {key, value} -> if key == name, do: value end)

  defp put_attribute(attributes, name, value) do
    [{name, value} | Enum.reject(attributes, fn {key, _value} -> key == name end)]
  end
end
