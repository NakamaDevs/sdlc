defmodule DocsCheck do
  @root Path.expand("..", __DIR__)

  @snapshot_fields ~w(
    source_url
    source_title
    source_language
    retrieved_at
    published_at
    source_version
    capture_scope
    conversion
    status
    license
    canonical_id
    trust
    prompt_injection_reviewed_at
    body_sha256
  )

  def run do
    english = language_files("en")
    spanish = language_files("es")

    errors =
      []
      |> check_inventory(english, spanish)
      |> check_documents([Path.join(@root, "README.md") | english ++ spanish])
      |> check_heading_parity(english, spanish)
      |> check_translation_residue(english, spanish)
      |> check_links([Path.join(@root, "README.md") | english ++ spanish])
      |> check_reference_index()
      |> check_snapshots()

    case errors do
      [] ->
        IO.puts("Documentation checks passed.")

      _ ->
        Enum.each(Enum.reverse(errors), &IO.puts(:stderr, "ERROR: #{&1}"))
        System.halt(1)
    end
  end

  defp language_files(language) do
    @root
    |> Path.join("#{language}/*.md")
    |> Path.wildcard()
    |> Enum.sort()
  end

  defp check_inventory(errors, english, spanish) do
    english_names = MapSet.new(english, &Path.basename/1)
    spanish_names = MapSet.new(spanish, &Path.basename/1)

    errors
    |> add_missing("es", MapSet.difference(english_names, spanish_names))
    |> add_missing("en", MapSet.difference(spanish_names, english_names))
  end

  defp add_missing(errors, language, missing) do
    if MapSet.size(missing) == 0 do
      errors
    else
      ["#{language}/ is missing: #{missing |> Enum.sort() |> Enum.join(", ")}" | errors]
    end
  end

  defp check_documents(errors, files) do
    Enum.reduce(files, errors, fn file, acc ->
      content = File.read!(file)
      relative = Path.relative_to(file, @root)
      headings = headings(content)

      acc
      |> require(String.ends_with?(content, "\n"), "#{relative} has no final newline")
      |> require(content != "", "#{relative} is empty")
      |> require(not Regex.match?(~r/[\t ]+$/m, content), "#{relative} has trailing whitespace")
      |> require(
        Enum.count(headings, fn {level, _line} -> level == 1 end) == 1,
        "#{relative} must have one H1 heading"
      )
      |> require(valid_heading_order?(headings), "#{relative} skips a heading level")
      |> require(references_last?(headings), "#{relative} must keep its references section last")
    end)
  end

  defp check_heading_parity(errors, english, spanish) do
    spanish_by_name = Map.new(spanish, &{Path.basename(&1), &1})

    Enum.reduce(english, errors, fn english_file, acc ->
      name = Path.basename(english_file)

      case spanish_by_name[name] do
        nil ->
          acc

        spanish_file ->
          english_content = File.read!(english_file)
          spanish_content = File.read!(spanish_file)
          english_levels = english_content |> headings() |> Enum.map(&elem(&1, 0))
          spanish_levels = spanish_content |> headings() |> Enum.map(&elem(&1, 0))

          acc
          |> require(
            english_levels == spanish_levels,
            "en/#{name} and es/#{name} have different heading structures"
          )
          |> require(
            guide_links(english_content) == guide_links(spanish_content),
            "en/#{name} and es/#{name} have different guide-link sequences"
          )
          |> require(
            external_link_targets(english_content) == external_link_targets(spanish_content),
            "en/#{name} and es/#{name} have different external links: #{difference_hint(external_link_targets(english_content), external_link_targets(spanish_content))}"
          )
          |> require(
            fenced_code_signature(english_content) == fenced_code_signature(spanish_content),
            "en/#{name} and es/#{name} have different executable code blocks: #{difference_hint(fenced_code_signature(english_content), fenced_code_signature(spanish_content))}"
          )
          |> require(
            technical_literals(english_content) == technical_literals(spanish_content),
            "en/#{name} and es/#{name} have different inline technical literals: #{difference_hint(technical_literals(english_content), technical_literals(spanish_content))}"
          )
          |> require(
            list_signature(english_content) == list_signature(spanish_content),
            "en/#{name} and es/#{name} have different list structures: #{difference_hint(list_signature(english_content), list_signature(spanish_content))}"
          )
          |> require(
            table_signature(english_content) == table_signature(spanish_content),
            "en/#{name} and es/#{name} have different table structures"
          )
      end
    end)
  end

  defp check_translation_residue(errors, english, spanish) do
    spanish_by_name = Map.new(spanish, &{Path.basename(&1), &1})

    Enum.reduce(english, errors, fn english_file, acc ->
      name = Path.basename(english_file)

      case spanish_by_name[name] do
        nil ->
          acc

        spanish_file ->
          english_lines =
            english_file
            |> File.read!()
            |> lines_outside_fences()
            |> Enum.map(&String.trim/1)
            |> MapSet.new()

          residue =
            spanish_file
            |> File.read!()
            |> lines_outside_fences()
            |> Enum.map(&String.trim/1)
            |> Enum.filter(&(MapSet.member?(english_lines, &1) and prose_line?(&1)))
            |> Enum.uniq()

          if residue == [] do
            acc
          else
            examples = residue |> Enum.take(3) |> Enum.join(" | ")
            ["es/#{name} retains #{length(residue)} English prose line(s): #{examples}" | acc]
          end
      end
    end)
  end

  defp prose_line?(line) do
    String.length(line) >= 60 and
      Regex.match?(~r/[A-Za-z]{4,}\s+[A-Za-z]{4,}/, line) and
      not String.starts_with?(line, ["#", "- [", "[", "|", "http", "<", "!"])
  end

  defp guide_links(content) do
    content
    |> lines_outside_fences()
    |> Enum.flat_map(fn line ->
      Regex.scan(~r/\]\((?:\.\/)?([A-Z][A-Z0-9-]*\.md)(?:#[^)]*)?\)/, line,
        capture: :all_but_first
      )
    end)
    |> List.flatten()
  end

  defp external_link_targets(content) do
    content
    |> lines_outside_fences()
    |> Enum.flat_map(fn line ->
      Regex.scan(~r/!?\[[^\]]*\]\(([^)\s]+)(?:\s+"[^"]*")?\)/, line, capture: :all_but_first)
    end)
    |> List.flatten()
    |> Enum.filter(&Regex.match?(~r/^https?:\/\//, &1))
    |> Enum.sort()
  end

  defp fenced_code_signature(content) do
    Regex.scan(~r/^```([^\n]*)\n(.*?)^```\s*$/ms, content, capture: :all_but_first)
    |> Enum.map(fn [info, body] ->
      language = info |> String.trim() |> String.downcase()
      executable = language not in ["", "text", "md", "markdown"]
      {language, if(executable, do: body, else: :translated_example)}
    end)
  end

  defp technical_literals(content) do
    content
    |> lines_outside_fences()
    |> Enum.flat_map(fn line ->
      Regex.scan(~r/(?<!`)`([^`\n]+)`(?!`)/u, line, capture: :all_but_first)
    end)
    |> List.flatten()
    |> Enum.filter(&technical_literal?/1)
    |> Enum.sort()
  end

  defp technical_literal?(literal) do
    Regex.match?(
      ~r/[\/_.:<>=]|--|\b(?:mise|mix|git|gh|npx|aspire|docker|kubectl|helm|dagger|elixir)\b/i,
      literal
    )
  end

  defp list_signature(content) do
    content
    |> lines_outside_fences()
    |> Enum.flat_map(fn line ->
      case Regex.run(~r/^(\s*)([-+*]|\d+[.)])\s+/, line, capture: :all_but_first) do
        [indent, marker] -> [{String.length(indent), ordered_marker?(marker)}]
        _ -> []
      end
    end)
    |> Enum.frequencies()
    |> Enum.sort()
  end

  defp ordered_marker?(marker), do: Regex.match?(~r/^\d/, marker)

  defp table_signature(content) do
    content
    |> lines_outside_fences()
    |> Enum.filter(&Regex.match?(~r/^\s*\|.*\|\s*$/, &1))
    |> Enum.map(fn line -> line |> String.split("|") |> length() end)
  end

  defp difference_hint(left, right) do
    size = max(length(left), length(right))

    index =
      if size == 0 do
        0
      else
        Enum.find(0..(size - 1), 0, fn index -> Enum.at(left, index) != Enum.at(right, index) end)
      end

    "item #{index + 1}, en=#{inspect(Enum.at(left, index))}, es=#{inspect(Enum.at(right, index))}"
  end

  defp check_links(errors, files) do
    Enum.reduce(files, errors, fn file, acc ->
      file
      |> File.read!()
      |> lines_outside_fences()
      |> Enum.with_index(1)
      |> Enum.reduce(acc, fn {line, number}, line_errors ->
        Regex.scan(~r/\[[^\]]*\]\(([^)\s]+)(?:\s+"[^"]*")?\)/, line, capture: :all_but_first)
        |> Enum.reduce(line_errors, fn [target], target_errors ->
          check_local_target(target_errors, file, number, target)
        end)
      end)
    end)
  end

  defp check_local_target(errors, file, line, target) do
    target = String.trim(target, "<>")

    if external_target?(target) do
      errors
    else
      path =
        target
        |> String.split(["#", "?"], parts: 2)
        |> hd()
        |> URI.decode()
        |> then(&Path.expand(&1, Path.dirname(file)))

      require(
        errors,
        path == Path.dirname(file) or File.exists?(path),
        "#{Path.relative_to(file, @root)}:#{line} has a missing local target: #{target}"
      )
    end
  end

  defp external_target?(target) do
    target == "" or String.starts_with?(target, ["#", "/", "//"]) or
      Regex.match?(~r/^[a-zA-Z][a-zA-Z0-9+.-]*:/, target)
  end

  defp check_reference_index(errors) do
    file = Path.join(@root, "references/README.md")

    errors
    |> require(File.exists?(file), "references/README.md is missing")
    |> then(fn current ->
      if File.exists?(file) do
        current
        |> check_documents([file])
        |> check_links([file])
        |> check_reference_inventory(file)
      else
        current
      end
    end)
  end

  defp check_reference_inventory(errors, index_file) do
    content = File.read!(index_file)

    @root
    |> Path.join("references/**/*.md")
    |> Path.wildcard()
    |> Enum.reject(&(&1 == index_file))
    |> Enum.reduce(errors, fn file, acc ->
      target = Path.relative_to(file, Path.dirname(index_file))

      require(
        acc,
        String.contains?(content, "](#{target})"),
        "references/README.md does not list #{target}"
      )
    end)
  end

  defp check_snapshots(errors) do
    files =
      @root
      |> Path.join("references/**/*.md")
      |> Path.wildcard()
      |> Enum.reject(&(Path.basename(&1) == "README.md"))
      |> Enum.sort()

    {errors, records} =
      Enum.reduce(files, {errors, []}, fn file, {acc, records} ->
        content = File.read!(file)
        relative = Path.relative_to(file, @root)

        case front_matter(content) do
          {:ok, metadata} ->
            missing = Enum.reject(@snapshot_fields, &Map.has_key?(metadata, &1))

            checked =
              acc
              |> require(missing == [], "#{relative} lacks metadata: #{Enum.join(missing, ", ")}")
              |> require(
                present?(metadata["canonical_id"]),
                "#{relative} lacks a canonical_id value"
              )
              |> require(present?(metadata["source_url"]), "#{relative} lacks a source_url value")
              |> require(
                date?(metadata["retrieved_at"]),
                "#{relative} has an invalid retrieved_at date"
              )
              |> require(
                optional_date?(metadata["published_at"]),
                "#{relative} has an invalid published_at date"
              )
              |> require(
                metadata["status"] in ["archived", "unavailable"],
                "#{relative} has an invalid status"
              )
              |> require(
                Regex.match?(~r/^[0-9a-f]{64}$/, metadata["body_sha256"] || ""),
                "#{relative} has an invalid body_sha256"
              )
              |> require_archived_fields(relative, metadata)
              |> require_unavailable_fields(relative, metadata)
              |> require(content != "", "#{relative} is empty")
              |> require(String.ends_with?(content, "\n"), "#{relative} has no final newline")

            {checked, [{relative, metadata} | records]}

          :error ->
            {["#{relative} has invalid YAML front matter" | acc], records}
        end
      end)

    errors
    |> check_unique_snapshot_field(records, "canonical_id")
    |> check_unique_snapshot_field(records, "source_url")
  end

  defp require_archived_fields(errors, relative, %{"status" => "archived"} = metadata) do
    errors
    |> require(present?(metadata["source_language"]), "#{relative} lacks a source_language value")
    |> require(present?(metadata["conversion"]), "#{relative} lacks a conversion value")
  end

  defp require_archived_fields(errors, _relative, _metadata), do: errors

  defp require_unavailable_fields(errors, relative, %{"status" => "unavailable"} = metadata) do
    errors
    |> require(present?(metadata["reason"]), "#{relative} lacks an unavailable reason")
    |> require(present?(metadata["next_action"]), "#{relative} lacks an unavailable next_action")
  end

  defp require_unavailable_fields(errors, _relative, _metadata), do: errors

  defp check_unique_snapshot_field(errors, records, field) do
    records
    |> Enum.group_by(fn {_relative, metadata} -> metadata[field] end, &elem(&1, 0))
    |> Enum.reject(fn {value, files} -> not present?(value) or length(files) == 1 end)
    |> Enum.reduce(errors, fn {value, files}, acc ->
      [
        "duplicate snapshot #{field} #{inspect(value)}: #{Enum.sort(files) |> Enum.join(", ")}"
        | acc
      ]
    end)
  end

  defp date?(value) when is_binary(value), do: match?({:ok, _date}, Date.from_iso8601(value))
  defp date?(_value), do: false

  defp optional_date?("null"), do: true
  defp optional_date?(value), do: date?(value)

  defp present?(value), do: value not in [nil, "", "null"]

  defp front_matter(content) do
    case String.split(content, "\n") do
      ["---" | rest] ->
        {metadata_lines, remaining} = Enum.split_while(rest, &(&1 != "---"))

        if remaining == [] do
          :error
        else
          metadata =
            metadata_lines
            |> Enum.flat_map(fn line ->
              case String.split(line, ":", parts: 2) do
                [key, value] -> [{String.trim(key), String.trim(value)}]
                _ -> []
              end
            end)
            |> Map.new()

          {:ok, metadata}
        end

      _ ->
        :error
    end
  end

  defp headings(content) do
    content
    |> lines_outside_fences()
    |> Enum.flat_map(fn line ->
      case Regex.run(~r/^([#]{1,6})\s+\S/, line) do
        [_, marks] -> [{String.length(marks), line}]
        _ -> []
      end
    end)
  end

  defp lines_outside_fences(content) do
    {lines, _fence} =
      content
      |> String.split("\n")
      |> Enum.reduce({[], nil}, fn line, {acc, fence} ->
        case Regex.run(~r/^\s*(```+|~~~+)/, line) do
          [_, marker] ->
            marker_type = String.first(marker)

            cond do
              is_nil(fence) -> {["" | acc], marker_type}
              marker_type == fence -> {["" | acc], nil}
              true -> {["" | acc], fence}
            end

          _ when is_nil(fence) ->
            {[line | acc], nil}

          _ ->
            {["" | acc], fence}
        end
      end)

    Enum.reverse(lines)
  end

  defp valid_heading_order?([]), do: true

  defp valid_heading_order?([{1, _line} | rest]) do
    result =
      Enum.reduce_while(rest, 1, fn {level, _line}, previous ->
        if level > previous + 1, do: {:halt, :error}, else: {:cont, level}
      end)

    result != :error
  end

  defp valid_heading_order?(_headings), do: false

  defp references_last?(headings) do
    level_two = Enum.filter(headings, fn {level, _line} -> level == 2 end)

    case Enum.find_index(level_two, fn {_level, line} ->
           line in ["## References", "## Referencias"]
         end) do
      nil -> true
      index -> index == length(level_two) - 1
    end
  end

  defp require(errors, true, _message), do: errors
  defp require(errors, false, message), do: [message | errors]
end

DocsCheck.run()
