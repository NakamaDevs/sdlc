defmodule Mix.Tasks.Sdlc.Capture do
  @shortdoc "Captures a public page as reader-focused Markdown"

  @moduledoc """
  Captures a public page as reader-focused Markdown.

      #{Sdlc.Reader.CLI.help()}

  Rendered mode executes untrusted JavaScript. Use a disposable,
  network-restricted environment for untrusted sources.
  """

  use Mix.Task

  @impl Mix.Task
  def run(arguments) do
    Mix.Task.run("app.start")

    case Sdlc.Reader.CLI.run(arguments) do
      {:ok, path} ->
        Mix.shell().info("Wrote #{path}")

      {:error, reason} ->
        Mix.raise("Capture failed: #{inspect(reason)}\n\n#{Sdlc.Reader.CLI.help()}")
    end
  end
end
