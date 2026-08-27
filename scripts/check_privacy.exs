Code.require_file("lib/privacy_check.exs", __DIR__)

root = Path.expand("..", __DIR__)

{tracked_files, 0} = System.cmd("git", ["ls-files", "-z"], cd: root)

documents =
  tracked_files
  |> String.split("\0", trim: true)
  |> Enum.sort()
  |> Enum.flat_map(fn relative_path ->
    path = Path.join(root, relative_path)

    case File.read(path) do
      {:ok, content} when is_binary(content) ->
        if String.valid?(content), do: [{relative_path, content}], else: []

      {:error, :enoent} ->
        []

      {:error, reason} ->
        raise "Privacy check could not read #{relative_path}: #{:file.format_error(reason)}"
    end
  end)

Sdlc.PrivacyCheck.validate!(documents)
IO.puts("Privacy checks passed for #{length(documents)} tracked text files.")
