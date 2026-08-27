defmodule Sdlc.PrivacyCheck do
  @moduledoc false

  @email ~r/(?<![A-Za-z0-9._%+-])[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}/u
  @ssn ~r/(?<!\d)\d{3}-\d{2}-\d{4}(?!\d)/
  @e164_phone ~r/(?<![A-Za-z0-9])\+[1-9]\d{9,14}(?!\d)/
  @separated_phone ~r/(?<![A-Za-z0-9])(?:\+[1-9]\d{0,2}[ .-])?(?:\(\d{2,4}\)|\d{2,4})[ .-]\d{3,4}[ .-]\d{4}(?!\d)/
  @gist_account_url ~r"https?://gist\.github\.com/[A-Za-z0-9](?:[A-Za-z0-9-]{0,38})/[0-9a-f]{20,64}"i

  @safe_email_domains ~w(example.com example.net example.org example.test users.noreply.github.com)
  @safe_transport_emails ~w(git@github.com git@gitlab.com git@bitbucket.org)
  @safe_role_emails ~w(privacy@nvidia.com)

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

        case File.read(path) do
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
      path_findings = line_findings(redacted_name, "path", name)
      report_name = if path_findings == [], do: name, else: redacted_name

      content_findings =
        content
        |> String.split("\n")
        |> Enum.with_index(1)
        |> Enum.flat_map(fn {line, number} -> line_findings(report_name, number, line) end)

      path_findings ++ content_findings
    end)
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

    structured = [
      {@ssn, "a government identifier pattern"},
      {@e164_phone, "an international phone number pattern"},
      {@separated_phone, "a phone number pattern"},
      {@gist_account_url, "a Gist account identifier"}
    ]

    Enum.reduce(structured, email_findings, fn {pattern, category}, findings ->
      if Regex.match?(pattern, line) do
        [%{file: file, line: number, category: category} | findings]
      else
        findings
      end
    end)
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

      if mode == "160000" do
        []
      else
        content = git!(root, ["cat-file", "blob", object], "read a staged Git blob")

        if String.valid?(content) do
          label =
            if stage == "0", do: relative_path, else: "#{relative_path} (index stage #{stage})"

          [{label, content}]
        else
          []
        end
      end
    end)
  end

  defp git_files!(root) do
    root
    |> git!(["ls-files", "-z"], "list Git-tracked files")
    |> String.split("\0", trim: true)
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
