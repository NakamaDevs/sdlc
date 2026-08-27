defmodule Sdlc.PrivacyCheck do
  @moduledoc false

  @email ~r/(?<![A-Za-z0-9._%+-])[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}/u
  @ssn ~r/(?<!\d)\d{3}-\d{2}-\d{4}(?!\d)/
  @e164_phone ~r/(?<![A-Za-z0-9])\+[1-9]\d{9,14}(?!\d)/
  @formatted_phone ~r/(?<!\d)\(\d{3}\) \d{3}-\d{4}(?!\d)/

  @safe_email_domains ~w(example.com example.net example.org example.test users.noreply.github.com)
  @safe_transport_emails ~w(git@github.com git@gitlab.com git@bitbucket.org)

  def findings(documents) when is_list(documents) do
    Enum.flat_map(documents, fn {name, content} ->
      content
      |> String.split("\n")
      |> Enum.with_index(1)
      |> Enum.flat_map(fn {line, number} -> line_findings(name, number, line) end)
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
      {@formatted_phone, "a phone number pattern"}
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

    normalized in @safe_transport_emails or
      Enum.any?(@safe_email_domains, fn domain ->
        String.ends_with?(normalized, "@" <> domain)
      end)
  end
end
