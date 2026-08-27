defmodule Mix.Tasks.Sdlc.Compare do
  @shortdoc "Compares static and rendered reader captures"

  @moduledoc """
  Compares a bounded static fetch with an opt-in Chrome-rendered capture.

      mix sdlc.compare URL --chrome PATH --isolation-confirmed [--output-dir PATH]

  The task writes comparison files below `_build/capture-comparisons` by default.
  It refuses existing output unless `--force` is present.
  Rendered mode executes untrusted JavaScript. External network isolation is required.
  """

  use Mix.Task

  @switches [
    chrome: :string,
    output_dir: :string,
    timeout: :integer,
    virtual_time_budget: :integer,
    isolation_confirmed: :boolean,
    force: :boolean
  ]

  @impl Mix.Task
  def run(arguments) do
    Mix.Task.run("app.start")

    with {options, [url], []} <- OptionParser.parse(arguments, strict: @switches),
         chrome when is_binary(chrome) <- options[:chrome],
         true <- options[:isolation_confirmed] == true,
         {:ok, comparison} <-
           Sdlc.Reader.Comparison.capture(url,
             chrome_path: chrome,
             isolation_confirmed: true,
             timeout: options[:timeout],
             virtual_time_budget: options[:virtual_time_budget]
           ),
         output_dir <- options[:output_dir] || default_output_dir(url),
         {:ok, path} <-
           Sdlc.Reader.Comparison.write_artifacts(comparison, output_dir,
             overwrite: options[:force] == true
           ) do
      Mix.shell().info("Wrote comparison to #{path}")
    else
      {_options, _arguments, invalid} when invalid != [] ->
        Mix.raise("Invalid options: #{inspect(invalid)}")

      {_options, remaining, []} ->
        Mix.raise("Expected one URL, received: #{inspect(remaining)}")

      nil ->
        Mix.raise("The --chrome option is required.")

      false ->
        Mix.raise("The --isolation-confirmed option is required.")

      {:error, reason} ->
        Mix.raise("Comparison failed: #{inspect(reason)}")
    end
  end

  defp default_output_dir(url) do
    id = :crypto.hash(:sha256, url) |> Base.encode16(case: :lower) |> binary_part(0, 12)
    Path.expand("_build/capture-comparisons/#{id}", File.cwd!())
  end
end
