defmodule Sdlc.PrivacyCheck do
  @moduledoc false

  @email ~r/(?<![A-Za-z0-9._%+-])[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}(?![A-Za-z0-9_%+-])/u
  @ssn ~r/(?<![A-Za-z0-9_])(?<!\d[\/.\-\p{Zs}\x{2010}-\x{2015}\x{2212}])\d{3}[\-\x{2010}-\x{2015}\x{2212}]\d{2}[\-\x{2010}-\x{2015}\x{2212}]\d{4}(?![A-Za-z0-9_]|[\/.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d)/u
  @e164_phone ~r/(?<![A-Za-z0-9_])\+[1-9]\d{7,14}(?![A-Za-z0-9_]|[\/.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d)/u
  @domestic_compact_phone ~r/(?<![A-Za-z0-9_\/.])\d{8,11}(?![A-Za-z0-9_]|[\/.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d)/u
  @international_grouped_phone ~r/(?<![A-Za-z0-9_])\+[1-9]\d{0,6}(?:[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d{1,8}){1,6}(?![A-Za-z0-9_]|[\/.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d)/u
  @international_trunk_phone ~r/(?<![A-Za-z0-9_])\+[1-9]\d{0,2}[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]?\(0\)[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]?\d{1,4}(?:[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d{1,8}){1,5}(?![A-Za-z0-9_]|[\/.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d)/u
  @separated_phone_patterns [
    ~r/(?<![A-Za-z0-9_\/.])(?:(?:\+[1-9]\d{0,2}[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]?)?\(\d{1,4}\)[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]?|(?:\+[1-9]\d{0,2}[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}])?\d{2,4}[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}])\d{3,4}[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d{4}(?![A-Za-z0-9_]|[\/.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d)/u,
    ~r/(?<![A-Za-z0-9_\/.])(?:(?:\+[1-9]\d{0,2}[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]?)?\(\d{1,4}\)[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]?|\+[1-9]\d{0,2}[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d{2,4}[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}])\d{5}[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d{4}(?![A-Za-z0-9_]|[\/.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d)/u,
    ~r/(?<![A-Za-z0-9_\/.])(?:\+[1-9]\d{0,2}[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]?)?\(\d{1,4}\)[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]?\d{4,8}(?![A-Za-z0-9_]|[\/.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d)/u,
    ~r/(?<![A-Za-z0-9_\/.])\+[1-9]\d{0,2}[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d{1,4}\/\d{4,8}(?![A-Za-z0-9_]|[\/.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d)/u,
    ~r/(?<![A-Za-z0-9_\/.])\d{2,4}\/\d{4,8}(?![A-Za-z0-9_]|[\/.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d)/u,
    ~r/(?<![A-Za-z0-9+\/.)])(?<!\d[\/.\-\p{Zs}\x{2010}-\x{2015}\x{2212}])\d{2}(?:[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d{2}){3,4}(?![A-Za-z0-9_]|[\/.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d)/u,
    ~r/(?<![A-Za-z0-9+\/.)\:])(?<!\d[\/.\-\p{Zs}\x{2010}-\x{2015}\x{2212}])\d{3}(?:[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d{3}){2}(?![A-Za-z0-9_]|[\/.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d)/u,
    ~r/(?<![A-Za-z0-9+\/.)\:])(?<!\d[\/.\-\p{Zs}\x{2010}-\x{2015}\x{2212}])(?!(?:\d{4}[.-]\d{4}|\d{5}[.-]\d{5})(?!\d))\d{2,8}[.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d{2,8}(?![A-Za-z0-9_]|[\/.\-\p{Zs}\x{2010}-\x{2015}\x{2212}]\d)/u
  ]
  @gist_account_url ~r"https?://gist\.github\.com/[A-Za-z0-9](?:[A-Za-z0-9-]{0,38})/[0-9a-f]{1,64}(?![0-9a-f])"i

  @safe_email_domains ~w(example.com example.net example.org example.test users.noreply.github.com)
  @safe_transport_emails ~w(git@github.com git@gitlab.com git@bitbucket.org)
  @safe_role_emails ~w(privacy@nvidia.com)
  @safe_numeric_url_query_keys ~w(arxiv_id id qid)
  @phone_label ~r/(?<![A-Za-z0-9_])(?:cell|mobile|phone|tel|telephone|telefono|teléfono)\s*[:=]\s*/iu

  def tracked_documents!(root) do
    index_documents = index_documents!(root)

    worktree_documents =
      root
      |> git_files!()
      |> Enum.sort()
      |> Enum.with_index(1)
      |> Enum.flat_map(fn {relative_path, index} ->
        path = Path.join(root, relative_path)
        redacted_path = "tracked path ##{index} (redacted)"

        case read_worktree_path(path) do
          {:ok, content} when is_binary(content) ->
            cond do
              not String.valid?(content) ->
                []

              Enum.any?(index_documents, fn
                {^relative_path, index_content} -> index_content == content
                _document -> false
              end) ->
                []

              true ->
                [{relative_path <> " (worktree)", content}]
            end

          {:error, :enoent} ->
            []

          :skip ->
            []

          {:error, reason} ->
            raise "Privacy check could not read #{redacted_path}: #{:file.format_error(reason)}"
        end
      end)

    index_documents ++ worktree_documents
  end

  def findings(documents) when is_list(documents) do
    documents
    |> Enum.with_index(1)
    |> Enum.flat_map(fn {{name, content}, index} ->
      redacted_name = "tracked path ##{index} (redacted)"
      path_findings = path_findings(redacted_name, name)

      content_findings =
        content
        |> String.split("\n")
        |> Enum.with_index(1)
        |> Enum.flat_map(fn {line, number} -> line_findings(redacted_name, number, line) end)

      path_findings ++ content_findings
    end)
  end

  defp path_findings(redacted_name, name) do
    name
    |> String.split(["/", "\\"])
    |> Enum.flat_map(fn component ->
      strict_component =
        component
        |> String.replace(~r/[\p{L}\p{M}][\p{L}\p{M}\d-]*[_=]+/u, " ")
        |> String.replace(~r/[\p{L}\p{M}_=.]+/u, " ")

      line_findings(redacted_name, "path", component) ++
        line_findings(redacted_name, "path", strict_component)
    end)
    |> Enum.uniq()
  end

  def validate!(documents) do
    case findings(documents) do
      [] ->
        :ok

      findings ->
        details =
          findings
          |> Enum.map_join("\n", fn finding ->
            "#{finding.file}:#{finding.line} contains #{finding.category}"
          end)

        raise "Privacy check failed. Review values without printing them:\n#{details}"
    end
  end

  defp line_findings(file, number, line) do
    email_findings =
      @email
      |> Regex.scan(line)
      |> List.flatten()
      |> Enum.reject(&safe_email?/1)
      |> Enum.map(fn _value -> %{file: file, line: number, category: "an email address"} end)

    phone_findings =
      cond do
        separated_phone?(line) ->
          [%{file: file, line: number, category: "a phone number pattern"}]

        international_phone?(line) ->
          [%{file: file, line: number, category: "an international phone number pattern"}]

        compact_domestic_phone?(line) ->
          [%{file: file, line: number, category: "a phone number pattern"}]

        true ->
          []
      end

    structured = [
      {@ssn, "a government identifier pattern"},
      {@gist_account_url, "a Gist account identifier"}
    ]

    Enum.reduce(structured, email_findings ++ phone_findings, fn {pattern, category}, findings ->
      if Regex.match?(pattern, line) do
        [%{file: file, line: number, category: category} | findings]
      else
        findings
      end
    end)
  end

  defp international_phone?(line) do
    line = Regex.replace(~r/(?<![A-Za-z0-9_\/.=])00(?=[1-9]\d)/u, line, "+")

    [@e164_phone, @international_grouped_phone, @international_trunk_phone]
    |> Enum.flat_map(&phone_candidates(&1, line))
    |> Enum.any?(&valid_phone_candidate?(&1, 8..15))
  end

  defp compact_domestic_phone?(line) do
    @domestic_compact_phone
    |> phone_candidate_locations(line)
    |> Enum.any?(fn {_candidate, start} -> not url_query_value?(line, start) end)
  end

  defp url_query_value?(line, candidate_start) do
    prefix = binary_part(line, 0, candidate_start)

    token =
      prefix
      |> String.split(~r/\s/u, trim: true)
      |> List.last()

    with token when is_binary(token) <- token,
         [key] <- Regex.run(~r/([A-Za-z0-9_.~-]+)=$/u, prefix, capture: :all_but_first),
         true <- String.downcase(key) in @safe_numeric_url_query_keys do
      Regex.match?(~r/^(?:(?:https?:\/\/)?[^\s?&#]+)?[?&#]\S*=$/iu, token)
    else
      _result -> false
    end
  end

  defp separated_phone?(line) do
    normalized_line = Regex.replace(@phone_label, line, " ")

    [line, normalized_line]
    |> Enum.uniq()
    |> Enum.any?(&separated_phone_in_line?/1)
  end

  defp separated_phone_in_line?(line) do
    @separated_phone_patterns
    |> Enum.flat_map(&phone_candidate_locations(&1, line))
    |> Enum.any?(fn {candidate, start} ->
      range = if String.starts_with?(candidate, "+"), do: 8..15, else: 8..11
      not url_query_value?(line, start) and valid_phone_candidate?(candidate, range)
    end)
  end

  defp phone_candidate_locations(pattern, line) do
    pattern
    |> Regex.scan(line, return: :index)
    |> List.flatten()
    |> Enum.map(fn {start, length} -> {binary_part(line, start, length), start} end)
  end

  defp phone_candidates(pattern, line) do
    pattern
    |> Regex.scan(line)
    |> List.flatten()
  end

  defp valid_phone_candidate?(candidate, range) do
    dialed_candidate =
      if String.starts_with?(candidate, "+") do
        String.replace(candidate, "(0)", "", global: false)
      else
        candidate
      end

    digit_count = dialed_candidate |> String.replace(~r/\D/u, "") |> String.length()
    digit_count in range
  end

  defp safe_email?(email) do
    normalized = String.downcase(email)

    normalized in @safe_transport_emails or normalized in @safe_role_emails or
      Enum.any?(@safe_email_domains, fn domain ->
        String.ends_with?(normalized, "@" <> domain)
      end)
  end

  defp index_documents!(root) do
    root
    |> git!(["ls-files", "--stage", "-z"], "read the Git index")
    |> String.split("\0", trim: true)
    |> Enum.sort()
    |> Enum.flat_map(fn entry ->
      [metadata, relative_path] = String.split(entry, "\t", parts: 2)
      [mode, object, stage] = String.split(metadata, " ", trim: true)

      label =
        if stage == "0", do: relative_path, else: "#{relative_path} (index stage #{stage})"

      if mode == "160000" do
        [{label, ""}]
      else
        content = git!(root, ["cat-file", "blob", object], "read a staged Git blob")

        if String.valid?(content) do
          [{label, content}]
        else
          [{label, ""}]
        end
      end
    end)
  end

  defp git_files!(root) do
    root
    |> git!(["ls-files", "-z"], "list Git-tracked files")
    |> String.split("\0", trim: true)
  end

  defp read_worktree_path(path) do
    case File.lstat(path) do
      {:ok, %File.Stat{type: :regular}} -> File.read(path)
      {:ok, %File.Stat{type: :symlink}} -> File.read_link(path)
      {:ok, _stat} -> :skip
      {:error, reason} -> {:error, reason}
    end
  end

  defp git!(root, arguments, operation) do
    case System.cmd("git", arguments, cd: root, stderr_to_stdout: true) do
      {output, 0} ->
        output

      {_output, status} ->
        raise "Privacy check could not #{operation}. Git exited with #{status}."
    end
  end
end
