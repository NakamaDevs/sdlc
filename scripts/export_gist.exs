Code.require_file("lib/privacy_check.exs", __DIR__)

defmodule GistExport do
  @root Path.expand("..", __DIR__)

  @files [
    {"SDLC.md", "SDLC.md"},
    {"LINEAR.md", "z01-LINEAR.md"},
    {"AGENT-SKILLS.md", "z02-AGENT-SKILLS.md"},
    {"MISE.md", "z03-MISE.md"},
    {"ASPIRE.md", "z04-ASPIRE.md"},
    {"OLLAMA.md", "z05-OLLAMA.md"},
    {"TESTING.md", "z06-TESTING.md"},
    {"SECURITY.md", "z07-SECURITY.md"},
    {"HARNESS.md", "z08-HARNESS.md"},
    {"ADOPTION.md", "z09-ADOPTION.md"},
    {"JOY.md", "z10-JOY.md"},
    {"BURNOUT.md", "z11-BURNOUT.md"},
    {"STRUCTURE.md", "z12-STRUCTURE.md"},
    {"HUMAN.md", "z13-HUMAN.md"},
    {"HERDR.md", "z14-HERDR.md"},
    {"OWASP.md", "z15-OWASP.md"},
    {"MCP.md", "z16-MCP.md"},
    {"AI-MLOPS.md", "z17-AI-MLOPS.md"},
    {"RUNNERS.md", "z18-RUNNERS.md"},
    {"INFERENCE.md", "z19-INFERENCE.md"},
    {"COMMUNICATION.md", "z20-COMMUNICATION.md"},
    {"NOTES.md", "z21-NOTES.md"},
    {"INTEGRATION.md", "z22-INTEGRATION.md"},
    {"CLAUDE.md", "z23-CLAUDE.md"},
    {"CODEX.md", "z24-CODEX.md"},
    {"HOOKS.md", "z25-HOOKS.md"},
    {"DAGGER.md", "z26-DAGGER.md"},
    {"MARKDOWN.md", "z27-MARKDOWN.md"},
    {"UPDATE.md", "z28-UPDATE.md"},
    {"REFERENCES.md", "z29-REFERENCES.md"},
    {"BRANCHES.md", "z30-BRANCHES.md"},
    {"COMMITS.md", "z31-COMMITS.md"},
    {"GITHUB.md", "z32-GITHUB.md"},
    {"WEB-CAPTURE.md", "z33-WEB-CAPTURE.md"},
    {"CODE-REVIEW.md", "z34-CODE-REVIEW.md"},
    {"CHANGELOG.md", "z35-CHANGELOG.md"},
    {"DEPLOY.md", "z36-DEPLOY.md"},
    {"PRIVACY.md", "z37-PRIVACY.md"},
    {"NAKAMADEVS.md", "zz01-NAKAMADEVS.md"}
  ]

  @optional_files ["NAKAMADEVS.md"]

  @organization_markers [
    ~r/@NakamaDevs\//i,
    ~r/\bNAK-\d+\b/i
  ]

  @organization_repository_marker ~r/(?:^|[^A-Za-z0-9_.-])NakamaDevs\/([A-Za-z0-9_.-]+)/im
  @public_organization_repositories ["sdlc"]

  @organization_marker_examples [
    "@nakamadevs/devs",
    "nak-662",
    "github.com/nakamadevs/kaicho",
    "github.com/NAKAMADEVS/SKILLS",
    "git@github.com:NakamaDevs/Kaicho.git",
    "ssh://git@github.com/NakamaDevs/skills.git",
    "https://raw.githubusercontent.com/NakamaDevs/Kaicho/main/policy.md",
    "https://api.github.com/repos/nakamadevs/SKILLS/contents/SKILL.md",
    "https://github.com/NakamaDevs/internal-project",
    "https://raw.githubusercontent.com/NakamaDevs/private-runner/main/README.md",
    "https://api.github.com/repos/NakamaDevs/internal-api/contents/config.json",
    "https://codeload.github.com/NakamaDevs/private-build/zip/main",
    "NakamaDevs/internal-service",
    "`NakamaDevs/Kaicho`",
    "[NakamaDevs/private-docs]",
    "repo=NakamaDevs/internal-config"
  ]

  @public_organization_repository_examples [
    "https://github.com/NakamaDevs/sdlc",
    "git@github.com:NAKAMADEVS/SDLC.GIT",
    "https://raw.githubusercontent.com/NakamaDevs/sdlc/main/README.md",
    "https://api.github.com/repos/NakamaDevs/sdlc/contents/README.md",
    "NakamaDevs/sdlc.",
    "`NakamaDevs/sdlc`",
    "[NakamaDevs/sdlc]",
    "repo=NakamaDevs/sdlc"
  ]

  def run([language, output]) when language in ["en", "es"] do
    validate_file_order!()
    validate_marker_configuration!()

    output = Path.expand(output)
    File.mkdir_p!(output)
    validate_output_directory!(output)

    anchors = Map.new(@files, fn {source, target} -> {source, gist_anchor(target)} end)

    Enum.each(@files, fn {source, target} ->
      input = Path.join([@root, language, source])
      content = File.read!(input)
      validate_profile_boundary!(content, source)
      content = rewrite_guide_links(content, anchors)
      content = rewrite_repository_links(content)
      Sdlc.PrivacyCheck.validate!([{target, content}])
      validate_export!(content, target)
      File.write!(Path.join(output, target), content)
    end)

    validate_output_directory!(output)

    IO.puts("Exported #{length(@files)} #{language} files to #{output}.")
  end

  def run(_arguments) do
    IO.puts(:stderr, "Usage: elixir scripts/export_gist.exs <en|es> <output-directory>")
    System.halt(2)
  end

  defp rewrite_guide_links(content, anchors) do
    Regex.replace(~r/\((?:\.\/)?([A-Z][A-Z0-9-]*\.md)\)/, content, fn full, file ->
      case anchors[file] do
        nil -> full
        anchor -> "(#{anchor})"
      end
    end)
  end

  defp rewrite_repository_links(content) do
    Regex.replace(~r/\(\.\.\/([^)]+)\)/, content, fn _full, path ->
      "(https://github.com/NakamaDevs/sdlc/blob/main/#{path})"
    end)
  end

  defp gist_anchor(filename) do
    normalized =
      filename
      |> String.downcase()
      |> String.replace(~r/[^a-z0-9]+/, "-")
      |> String.trim("-")

    "#file-#{normalized}"
  end

  defp validate_output_directory!(output) do
    expected = MapSet.new(@files, &elem(&1, 1))
    entries = File.ls!(output)

    if Enum.any?(entries, &(not MapSet.member?(expected, &1))) do
      raise "Gist output directory contains unexpected entries. Clear it before export."
    end

    Enum.each(entries, fn entry ->
      case File.lstat(Path.join(output, entry)) do
        {:ok, %{type: :regular}} ->
          :ok

        _result ->
          raise "Gist output directory contains a non-regular entry. Clear it before export."
      end
    end)
  end

  defp validate_file_order! do
    sources = Enum.map(@files, &elem(&1, 0))
    split_at = length(sources) - length(@optional_files)
    {generic, optional} = Enum.split(sources, split_at)

    if optional != @optional_files or Enum.any?(generic, &(&1 in @optional_files)) do
      raise "Optional Gist files must remain last: #{Enum.join(@optional_files, ", ")}"
    end
  end

  defp validate_profile_boundary!(content, source) do
    if source not in @optional_files do
      case find_organization_marker(content) do
        nil ->
          :ok

        _marker ->
          raise "#{source} contains an organization marker outside the optional profile."
      end
    end
  end

  defp validate_marker_configuration! do
    Enum.each(@organization_marker_examples, fn example ->
      if is_nil(find_organization_marker(example)) do
        raise "Organization marker configuration misses a case variant: #{example}"
      end
    end)

    Enum.each(@public_organization_repository_examples, fn example ->
      if find_organization_marker(example) do
        raise "Organization marker configuration rejects a public repository: #{example}"
      end
    end)
  end

  defp find_organization_marker(content) do
    case Enum.find(@organization_markers, &Regex.match?(&1, content)) do
      nil -> find_private_organization_repository(content)
      marker -> marker
    end
  end

  defp find_private_organization_repository(content) do
    @organization_repository_marker
    |> Regex.scan(content, capture: :all_but_first)
    |> Enum.map(fn [repository] -> repository end)
    |> Enum.find(fn repository ->
      repository
      |> String.downcase()
      |> String.trim_trailing(".")
      |> String.trim_trailing(".git")
      |> then(&(&1 not in @public_organization_repositories))
    end)
  end

  defp validate_export!(content, target) do
    case Regex.run(~r/!?\[[^\]]*\]\((?!#|https?:\/\/|mailto:)([^)\s]+)[^)]*\)/, content,
           capture: :all_but_first
         ) do
      [_destination] ->
        raise "#{target} retains a relative Gist destination."

      nil ->
        :ok
    end
  end
end

GistExport.run(System.argv())
