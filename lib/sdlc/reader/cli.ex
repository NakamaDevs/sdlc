defmodule Sdlc.Reader.CLI do
  @moduledoc false

  alias Sdlc.Reader.Capture
  alias Sdlc.Reader.Renderer.Chrome

  @switches [
    output: :string,
    canonical_id: :string,
    images: :string,
    assets_dir: :string,
    image_license: :string,
    license: :string,
    render: :boolean,
    isolation_confirmed: :boolean,
    chrome: :string,
    timeout: :integer,
    virtual_time_budget: :integer,
    retrieved_at: :string,
    published_at: :string,
    source_version: :string,
    capture_scope: :string,
    force: :boolean
  ]

  @aliases [o: :output]

  @spec run([String.t()], keyword()) :: {:ok, Path.t()} | {:error, term()}
  def run(arguments, dependencies \\ []) when is_list(arguments) do
    capture = Keyword.get(dependencies, :capture, Capture)

    with {:ok, url, parsed} <- parse(arguments),
         {:ok, output} <- required(parsed, :output),
         {:ok, canonical_id} <- required(parsed, :canonical_id),
         :ok <- validate_output(output, parsed[:force]),
         {:ok, image_policy} <- image_policy(parsed[:images]),
         {:ok, capture_options} <- capture_options(parsed, image_policy, output),
         {:ok, result} <- capture.capture(url, capture_options),
         {:ok, path} <- capture.write(result, output, write_options(parsed, canonical_id)) do
      {:ok, path}
    end
  end

  @spec help() :: String.t()
  def help do
    """
    Usage:
      mix sdlc.capture URL --output PATH --canonical-id ID [options]

    Options:
      --images link|local|omit       Keep links by default.
      --assets-dir PATH              Store optimized local image copies here.
      --image-license SPDX-OR-TEXT   Required for local image copies.
      --license SPDX-OR-TEXT         Record the source-page license.
      --render                       Execute the page with Chrome Headless.
      --isolation-confirmed          Confirm external network isolation.
      --chrome PATH                  Use this verified Chrome executable.
      --timeout MILLISECONDS         Bound navigation and rendering.
      --virtual-time-budget MS       Advance page timers before DOM capture.
      --retrieved-at YYYY-MM-DD      Override the UTC retrieval date.
      --published-at YYYY-MM-DD      Record the source publication date.
      --source-version VERSION       Record the source version.
      --capture-scope SCOPE          Use page by default.
      --force                        Replace an existing output file.
    """
  end

  defp parse(arguments) do
    case OptionParser.parse(arguments, strict: @switches, aliases: @aliases) do
      {parsed, [url], []} -> {:ok, url, parsed}
      {_parsed, [], []} -> {:error, :url_required}
      {_parsed, rest, []} -> {:error, {:unexpected_arguments, rest}}
      {_parsed, _rest, invalid} -> {:error, {:invalid_options, invalid}}
    end
  end

  defp required(options, key) do
    case Keyword.get(options, key) do
      value when is_binary(value) and value != "" -> {:ok, value}
      _ -> {:error, {:missing_option, key}}
    end
  end

  defp validate_output(output, true) when is_binary(output) do
    case File.lstat(output) do
      {:ok, %{type: :symlink}} -> {:error, {:symlink_output, output}}
      {:ok, _stat} -> :ok
      {:error, :enoent} -> :ok
      {:error, reason} -> {:error, reason}
    end
  end

  defp validate_output(output, _force) do
    case File.lstat(output) do
      {:ok, %{type: :symlink}} -> {:error, {:symlink_output, output}}
      {:ok, _stat} -> {:error, {:output_exists, output}}
      {:error, :enoent} -> :ok
      {:error, reason} -> {:error, reason}
    end
  end

  defp image_policy(nil), do: {:ok, :link}
  defp image_policy("link"), do: {:ok, :link}
  defp image_policy("local"), do: {:ok, :local}
  defp image_policy("omit"), do: {:ok, :omit}
  defp image_policy(value), do: {:error, {:invalid_image_policy, value}}

  defp capture_options(parsed, image_policy, output) do
    base =
      [
        image_policy: image_policy,
        assets_dir: parsed[:assets_dir],
        asset_path_prefix: asset_path_prefix(parsed[:assets_dir], output),
        image_license: parsed[:image_license],
        timeout: parsed[:timeout]
      ]
      |> compact()

    if parsed[:render] do
      with {:ok, chrome_path} <- required(parsed, :chrome),
           :ok <- require_isolation(parsed) do
        {:ok,
         compact(
           base ++
             [
               renderer: Chrome,
               chrome_path: chrome_path,
               isolation_confirmed: true,
               virtual_time_budget: parsed[:virtual_time_budget]
             ]
         )}
      end
    else
      {:ok, base}
    end
  end

  defp require_isolation(parsed) do
    if parsed[:isolation_confirmed] == true,
      do: :ok,
      else: {:error, :render_isolation_required}
  end

  defp write_options(parsed, canonical_id) do
    compact(
      canonical_id: canonical_id,
      license: parsed[:license],
      retrieved_at: parsed[:retrieved_at],
      published_at: parsed[:published_at],
      source_version: parsed[:source_version],
      capture_scope: parsed[:capture_scope],
      overwrite: parsed[:force] == true
    )
  end

  defp asset_path_prefix(nil, _output), do: nil

  defp asset_path_prefix(assets_dir, output) do
    assets_dir
    |> Path.expand()
    |> Path.relative_to(output |> Path.expand() |> Path.dirname())
  end

  defp compact(options), do: Enum.reject(options, fn {_key, value} -> is_nil(value) end)
end
