Code.require_file("lib/privacy_check.exs", __DIR__)

root = Path.expand("..", __DIR__)

files =
  [Path.join(root, "AGENTS.md"), Path.join(root, "README.md")] ++
    Path.wildcard(Path.join(root, "{en,es}/*.md"))

documents =
  files
  |> Enum.sort()
  |> Enum.map(fn file -> {Path.relative_to(file, root), File.read!(file)} end)

Sdlc.PrivacyCheck.validate!(documents)
IO.puts("Privacy checks passed for #{length(documents)} maintained documents.")
