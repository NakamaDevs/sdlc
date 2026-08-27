defmodule SnapshotReview do
  @root Path.expand("..", __DIR__)
  @review_fields ~w(trust prompt_injection_reviewed_at body_sha256)

  def run([date, "--confirm-human-review"]) do
    validate_date!(date)
    scan_content!()

    snapshots()
    |> Enum.each(&record_review(&1, date))

    IO.puts("Recorded the #{date} prompt-injection review for #{length(snapshots())} snapshots.")
  end

  def run(_arguments) do
    IO.puts(
      :stderr,
      "Usage: mix run scripts/record_snapshot_review.exs -- <YYYY-MM-DD> --confirm-human-review"
    )

    System.halt(2)
  end

  defp validate_date!(date) do
    case Date.from_iso8601(date) do
      {:ok, parsed} ->
        if Date.compare(parsed, Date.utc_today()) == :gt,
          do: raise(ArgumentError, "review date cannot be in the future"),
          else: :ok

      _ ->
        raise ArgumentError, "review date must use YYYY-MM-DD"
    end
  end

  defp scan_content! do
    executable = System.find_executable("mix") || raise "mix is not available"

    {output, status} =
      System.cmd(executable, ["run", "scripts/check_prompt_injection.exs", "--", "--scan-only"],
        cd: @root,
        stderr_to_stdout: true
      )

    IO.write(output)

    if status != 0 do
      IO.puts(:stderr, "The content scan failed. No review metadata changed.")
      System.halt(status)
    end
  end

  defp snapshots do
    @root
    |> Path.join("references/**/*.md")
    |> Path.wildcard()
    |> Enum.reject(&(Path.basename(&1) == "README.md"))
    |> Enum.sort()
  end

  defp record_review(file, date) do
    content = File.read!(file)

    case Regex.run(~r/\A---\n(.*?)\n---\n(.*)\z/s, content) do
      [_, metadata_text, body] ->
        metadata_lines =
          metadata_text
          |> String.split("\n")
          |> Enum.reject(fn line ->
            case String.split(line, ":", parts: 2) do
              [key, _value] -> String.trim(key) in @review_fields
              _ -> false
            end
          end)

        review_lines = [
          "trust: untrusted",
          "prompt_injection_reviewed_at: #{date}",
          "body_sha256: #{sha256(body)}"
        ]

        updated = "---\n#{Enum.join(metadata_lines ++ review_lines, "\n")}\n---\n#{body}"
        File.write!(file, updated)

      _ ->
        raise "#{Path.relative_to(file, @root)} has invalid YAML front matter"
    end
  end

  defp sha256(content) do
    :crypto.hash(:sha256, content) |> Base.encode16(case: :lower)
  end
end

SnapshotReview.run(System.argv())
