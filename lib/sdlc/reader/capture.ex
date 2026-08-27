defmodule Sdlc.Reader.Capture do
  @moduledoc """
  Captures a public web page as reviewed-reader Markdown.

  Captured text remains untrusted. The writer does not claim a human
  prompt-injection review or create a body hash.
  """

  alias Sdlc.Reader
  alias Sdlc.Reader.{Fetcher, HTML, ImageOptimizer, MarkdownDocument, Validator}

  @conversion "sdlc-reader-0.1.0"
  @image_pattern ~r/!\[(?<alt>(?:\\.|[^\]])*)\]\((?<url><[^>]+>|[^\s\)]+)(?:\s+"(?<title>(?:\\.|[^"\\])*)")?\)/
  @image_max_bytes 25 * 1024 * 1024
  @image_max_count 20
  @image_max_total_bytes 100 * 1024 * 1024
  @image_max_output_bytes 100 * 1024 * 1024

  defmodule Result do
    @moduledoc "The result of one reader capture."

    @enforce_keys [:source_url, :document, :markdown]
    defstruct [:source_url, :document, :markdown, issues: [], images: []]

    @type t :: %__MODULE__{
            source_url: String.t(),
            document: Sdlc.Reader.Document.t(),
            markdown: String.t(),
            issues: [map()],
            images: [map()]
          }
  end

  @type image_policy :: :link | :local | :omit

  @spec capture(String.t(), keyword()) :: {:ok, Result.t()} | {:error, term()}
  def capture(url, options \\ []) when is_binary(url) do
    fetcher = Keyword.get(options, :fetcher, Fetcher)
    policy = Keyword.get(options, :image_policy, :link)

    with :ok <- validate_policy(policy, options),
         {:ok, response} <- acquire(url, options, fetcher),
         :ok <- validate_html_response(response),
         {:ok, document} <- Reader.convert_html(response.body, source_url: response.url),
         {:ok, markdown, images} <- process_images(document.markdown, policy, options, fetcher),
         markdown = normalize_markdown(markdown) do
      case validate_markdown(markdown, options) do
        {:ok, issues} ->
          document = %{document | source_url: response.url, markdown: markdown}

          {:ok,
           %Result{
             source_url: response.url,
             document: document,
             markdown: markdown,
             issues: issues,
             images: Enum.map(images, &Map.delete(&1, :created))
           }}

        {:error, _reason} = error ->
          cleanup_images(images)
          error
      end
    end
  end

  @spec write(Result.t(), Path.t(), keyword()) :: {:ok, Path.t()} | {:error, term()}
  def write(result, output, options \\ [])

  def write(%Result{} = result, output, options) when is_binary(output) do
    with {:ok, canonical_id} <- required_option(options, :canonical_id),
         {:ok, retrieved_at} <- date_option(options, :retrieved_at, Date.utc_today()),
         :ok <- validate_output(output, options),
         :ok <- ensure_parent(output),
         content <- snapshot(result, canonical_id, retrieved_at, options),
         :ok <- write_output(output, content, Keyword.get(options, :overwrite, false)) do
      {:ok, output}
    end
  end

  def write(_result, _output, _options), do: {:error, :invalid_capture_result}

  defp validate_policy(policy, _options) when policy in [:link, :omit], do: :ok

  defp validate_policy(:local, options) do
    cond do
      not present?(options[:image_license]) -> {:error, :image_license_required}
      not present?(options[:assets_dir]) -> {:error, :assets_dir_required}
      true -> :ok
    end
  end

  defp validate_policy(_policy, _options), do: {:error, :invalid_image_policy}

  defp fetch_options(options) do
    Keyword.take(options, [:max_body_bytes, :max_redirects, :timeout, :resolver, :user_agent])
  end

  defp acquire(url, options, fetcher) do
    case Keyword.get(options, :renderer) do
      nil ->
        fetcher.fetch(url, fetch_options(options))

      renderer when is_atom(renderer) ->
        renderer.render(url, Keyword.put(renderer_options(options), :fetcher, fetcher))

      _ ->
        {:error, :invalid_renderer}
    end
  end

  defp renderer_options(options) do
    Keyword.take(options, [
      :chrome_path,
      :isolation_confirmed,
      :max_body_bytes,
      :profile_root,
      :renderer_runner,
      :resolver,
      :timeout,
      :virtual_time_budget
    ])
    |> then(fn renderer_options ->
      case Keyword.pop(renderer_options, :renderer_runner) do
        {nil, values} -> values
        {runner, values} -> Keyword.put(values, :runner, runner)
      end
    end)
  end

  defp validate_html_response(%{content_type: content_type, body: body}) when is_binary(body) do
    normalized = normalize_content_type(content_type)

    cond do
      not String.valid?(body) -> {:error, :invalid_html_encoding}
      normalized in ["text/html", "application/xhtml+xml"] -> :ok
      normalized == "" and html_body?(body) -> :ok
      true -> {:error, {:unexpected_content_type, content_type}}
    end
  end

  defp validate_html_response(_response), do: {:error, :invalid_fetch_response}

  defp html_body?(body), do: HTML.document?(body)

  defp process_images(markdown, :link, _options, _fetcher), do: {:ok, markdown, []}

  defp process_images(markdown, :omit, _options, _fetcher) do
    {:ok, Regex.replace(@image_pattern, markdown, ""), []}
  end

  defp process_images(markdown, :local, options, fetcher) do
    matches =
      @image_pattern
      |> Regex.scan(markdown, capture: :first)
      |> List.flatten()
      |> Enum.uniq()

    limits = %{
      count: Keyword.get(options, :image_max_count, @image_max_count),
      input_bytes: Keyword.get(options, :image_max_total_bytes, @image_max_total_bytes),
      output_bytes: Keyword.get(options, :image_max_output_bytes, @image_max_output_bytes)
    }

    with :ok <- validate_image_limits(matches, limits) do
      Enum.reduce_while(
        matches,
        {:ok, markdown, [], 0, 0},
        fn full, {:ok, current, images, input_bytes, output_bytes} ->
          captures = named_captures(full)
          remaining_bytes = limits.input_bytes - input_bytes

          case localize_image(captures, options, fetcher, remaining_bytes) do
            {:ok, replacement, image} ->
              next_input = input_bytes + image.input_bytes
              next_output = output_bytes + image.output_bytes

              if next_output <= limits.output_bytes do
                {:cont,
                 {:ok, String.replace(current, captures.full, replacement), [image | images],
                  next_input, next_output}}
              else
                cleanup_images([image | images])
                {:halt, {:error, :image_output_budget_exceeded}}
              end

            {:error, reason} ->
              cleanup_images(images)
              {:halt, {:error, {:image_capture_failed, captures.url, reason}}}
          end
        end
      )
      |> case do
        {:ok, processed, images, _input_bytes, _output_bytes} ->
          {:ok, processed, Enum.reverse(images)}

        error ->
          error
      end
    end
  end

  defp validate_image_limits(matches, limits) do
    cond do
      not positive_integer?(limits.count) -> {:error, :invalid_image_max_count}
      not positive_integer?(limits.input_bytes) -> {:error, :invalid_image_input_budget}
      not positive_integer?(limits.output_bytes) -> {:error, :invalid_image_output_budget}
      length(matches) > limits.count -> {:error, :image_count_exceeded}
      true -> :ok
    end
  end

  defp named_captures(full) do
    fields = Regex.named_captures(@image_pattern, full)

    %{
      full: full,
      alt: Map.get(fields, "alt", ""),
      url: fields |> Map.get("url", "") |> String.trim("<>"),
      title: Map.get(fields, "title", "")
    }
  end

  defp localize_image(_capture, _options, _fetcher, remaining_bytes)
       when remaining_bytes <= 0,
       do: {:error, :image_input_budget_exceeded}

  defp localize_image(capture, options, fetcher, remaining_bytes) do
    per_image_max = Keyword.get(options, :image_max_bytes, @image_max_bytes)

    if positive_integer?(per_image_max) do
      do_localize_image(capture, options, fetcher, min(per_image_max, remaining_bytes))
    else
      {:error, :invalid_image_max_bytes}
    end
  end

  defp do_localize_image(capture, options, fetcher, max_body_bytes) do
    fetch_options =
      fetch_options(options) ++
        [
          max_body_bytes: max_body_bytes,
          accept: "image/*"
        ]

    optimizer = Keyword.get(options, :image_optimizer, ImageOptimizer)
    output_dir = Keyword.fetch!(options, :assets_dir)

    with {:ok, response} <- fetcher.fetch(capture.url, fetch_options),
         :ok <- validate_image_response(response),
         {:ok, optimized} <-
           optimizer.optimize(response.body,
             source_url: response.url,
             content_type: response.content_type,
             output_dir: output_dir,
             max_dimension: Keyword.get(options, :image_max_dimension, 1_600),
             quality: Keyword.get(options, :image_quality, 85)
           ) do
      path_prefix = Keyword.get(options, :asset_path_prefix, Path.basename(output_dir))
      local_path = Path.join(path_prefix, Path.basename(optimized.path))
      replacement = image_markdown(capture.alt, local_path, capture.title)

      {:ok, replacement,
       %{
         source_url: response.url,
         path: optimized.path,
         markdown_path: local_path,
         license: options[:image_license],
         width: optimized.width,
         height: optimized.height,
         input_bytes: optimized.input_bytes,
         output_bytes: optimized.output_bytes,
         created: Map.get(optimized, :created, true)
       }}
    end
  end

  defp validate_image_response(%{content_type: content_type}) do
    if normalize_content_type(content_type) in [
         "image/png",
         "image/jpeg",
         "image/jpg",
         "image/webp"
       ] do
      :ok
    else
      {:error, :unsupported_image_type}
    end
  end

  defp validate_image_response(_response), do: {:error, :invalid_fetch_response}

  defp image_markdown(alt, path, ""), do: "![#{alt}](#{path})"
  defp image_markdown(alt, path, title), do: ~s|![#{alt}](#{path} "#{title}")|

  defp validate_markdown(markdown, options) do
    case Validator.validate(markdown) do
      {:ok, []} ->
        {:ok, []}

      {:error, issues} ->
        if Keyword.get(options, :allow_unsafe, false) do
          {:ok, issues}
        else
          {:error, {:unsafe_markdown, issues}}
        end
    end
  end

  defp cleanup_images(images) do
    Enum.each(images, fn image ->
      if image[:created] == true and is_binary(image[:path]), do: File.rm(image.path)
    end)
  end

  defp normalize_markdown(markdown) do
    MarkdownDocument.normalize(markdown)
  end

  defp snapshot(result, canonical_id, retrieved_at, options) do
    metadata = [
      {"source_url", result.source_url},
      {"source_title", result.document.title},
      {"source_language", result.document.language || "und"},
      {"retrieved_at", retrieved_at},
      {"published_at", options[:published_at] || result.document.published_at},
      {"source_version", options[:source_version]},
      {"capture_scope", options[:capture_scope] || "page"},
      {"conversion", @conversion},
      {"status", "archived"},
      {"license", options[:license]},
      {"canonical_id", canonical_id},
      {"trust", "untrusted"},
      {"prompt_injection_reviewed_at", nil},
      {"body_sha256", nil}
    ]

    front_matter =
      Enum.map_join(metadata, "\n", fn {key, value} -> "#{key}: #{yaml_scalar(value)}" end)

    markdown = String.trim(result.markdown) <> "\n"

    "---\n#{front_matter}\n---\n\n#{markdown}"
  end

  defp yaml_scalar(nil), do: "null"
  defp yaml_scalar(%Date{} = date), do: Date.to_iso8601(date)

  defp yaml_scalar(value) when is_binary(value) do
    value = value |> String.replace(["\r", "\n"], " ") |> String.trim()

    if Regex.match?(~r/^[A-Za-z0-9_\.\/:+\-]+$/, value) and value not in ["null", "true", "false"] do
      value
    else
      escaped = value |> String.replace("\\", "\\\\") |> String.replace("\"", "\\\"")
      "\"#{escaped}\""
    end
  end

  defp required_option(options, key) do
    case Keyword.get(options, key) do
      value when is_binary(value) and value != "" -> {:ok, value}
      _ -> {:error, {:missing_option, key}}
    end
  end

  defp date_option(options, key, default) do
    case Keyword.get(options, key, default) do
      %Date{} = date -> {:ok, date}
      value when is_binary(value) -> Date.from_iso8601(value)
      _ -> {:error, {:invalid_date, key}}
    end
  end

  defp ensure_parent(output) do
    output |> Path.dirname() |> File.mkdir_p()
  end

  defp validate_output(output, options) do
    overwrite = Keyword.get(options, :overwrite, false)

    case File.lstat(output) do
      {:ok, %{type: :symlink}} ->
        {:error, {:symlink_output, output}}

      {:ok, _stat} when not overwrite ->
        {:error, {:output_exists, output}}

      {:ok, _stat} ->
        :ok

      {:error, :enoent} ->
        :ok

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp write_output(output, content, false) do
    case File.write(output, content, [:binary, :exclusive]) do
      :ok -> :ok
      {:error, :eexist} -> {:error, {:output_exists, output}}
      {:error, reason} -> {:error, reason}
    end
  end

  defp write_output(output, content, true) do
    suffix = :crypto.strong_rand_bytes(8) |> Base.url_encode64(padding: false)
    temporary = output <> ".new-" <> suffix

    with :ok <- File.write(temporary, content, [:binary, :exclusive]),
         :ok <- File.rename(temporary, output) do
      :ok
    else
      {:error, reason} = error ->
        File.rm(temporary)
        {:error, reason || error}
    end
  end

  defp normalize_content_type(value) when is_binary(value) do
    value |> String.split(";", parts: 2) |> hd() |> String.trim() |> String.downcase()
  end

  defp normalize_content_type(_value), do: ""
  defp present?(value), do: is_binary(value) and String.trim(value) != ""
  defp positive_integer?(value), do: is_integer(value) and value > 0
end
