defmodule Sdlc.Reader.Comparison do
  @moduledoc """
  Compares static and rendered reader captures.

  The report measures retained structure and text. It never determines source
  truth or authorizes publication without human review.
  """

  alias Sdlc.Reader.Capture
  alias Sdlc.Reader.Renderer.Chrome

  @spec capture(String.t(), keyword()) :: {:ok, map()} | {:error, map()}
  def capture(url, options \\ []) do
    capture_module = Keyword.get(options, :capture, Capture)
    shared = shared_options(options)

    static = capture_module.capture(url, shared)

    rendered =
      capture_module.capture(
        url,
        shared ++
          compact(
            renderer: Chrome,
            chrome_path: options[:chrome_path],
            isolation_confirmed: options[:isolation_confirmed],
            profile_root: options[:profile_root],
            virtual_time_budget: options[:virtual_time_budget]
          )
      )

    case {static, rendered} do
      {{:ok, static_result}, {:ok, rendered_result}} ->
        {:ok,
         %{
           source_url: url,
           static: static_result,
           rendered: rendered_result,
           report: compare(static_result, rendered_result)
         }}

      _ ->
        {:error,
         %{
           source_url: url,
           static: summarize_capture(static),
           rendered: summarize_capture(rendered)
         }}
    end
  end

  @spec compare(Capture.Result.t(), Capture.Result.t()) :: map()
  def compare(%Capture.Result{} = static, %Capture.Result{} = rendered) do
    static_metrics = metrics(static)
    rendered_metrics = metrics(rendered)
    static_words = word_set(static.markdown)
    rendered_words = word_set(rendered.markdown)
    rendered_only = MapSet.difference(rendered_words, static_words) |> MapSet.size()
    shared = MapSet.intersection(static_words, rendered_words) |> MapSet.size()
    union = MapSet.union(static_words, rendered_words) |> MapSet.size()
    similarity = if union == 0, do: 1.0, else: Float.round(shared / union, 3)

    %{
      static: static_metrics,
      rendered: rendered_metrics,
      rendered_only_words: rendered_only,
      vocabulary_similarity: similarity,
      assessment: assessment(static_metrics, rendered_metrics, rendered_only, similarity),
      requires_human_review: true
    }
  end

  @spec write_artifacts(map(), Path.t(), keyword()) :: {:ok, Path.t()} | {:error, term()}
  def write_artifacts(comparison, output_dir, options \\ [])

  def write_artifacts(
        %{static: static, rendered: rendered, report: _report} = comparison,
        output_dir,
        options
      )
      when is_binary(output_dir) do
    artifacts = [
      {"static.md", static.markdown},
      {"rendered.md", rendered.markdown},
      {"REPORT.md", report_markdown(comparison)}
    ]

    overwrite = Keyword.get(options, :overwrite, false)

    with :ok <- validate_output_dir(output_dir),
         :ok <- File.mkdir_p(output_dir),
         :ok <- validate_artifacts(output_dir, artifacts, overwrite),
         :ok <- write_all_artifacts(output_dir, artifacts, overwrite) do
      {:ok, output_dir}
    end
  end

  def write_artifacts(_comparison, _output_dir, _options), do: {:error, :invalid_comparison}

  defp validate_output_dir(output_dir) do
    case File.lstat(output_dir) do
      {:ok, %{type: :symlink}} -> {:error, {:symlink_output, output_dir}}
      {:ok, %{type: :directory}} -> :ok
      {:ok, _stat} -> {:error, {:invalid_output_directory, output_dir}}
      {:error, :enoent} -> :ok
      {:error, reason} -> {:error, reason}
    end
  end

  defp validate_artifacts(output_dir, artifacts, overwrite) do
    Enum.reduce_while(artifacts, :ok, fn {name, _content}, :ok ->
      path = Path.join(output_dir, name)

      case File.lstat(path) do
        {:ok, %{type: :symlink}} -> {:halt, {:error, {:symlink_output, path}}}
        {:ok, _stat} when not overwrite -> {:halt, {:error, {:output_exists, path}}}
        {:ok, _stat} -> {:cont, :ok}
        {:error, :enoent} -> {:cont, :ok}
        {:error, reason} -> {:halt, {:error, reason}}
      end
    end)
  end

  defp write_all_artifacts(output_dir, artifacts, overwrite) do
    Enum.reduce_while(artifacts, :ok, fn {name, content}, :ok ->
      case write_artifact(Path.join(output_dir, name), content, overwrite) do
        :ok -> {:cont, :ok}
        {:error, _reason} = error -> {:halt, error}
      end
    end)
  end

  defp write_artifact(path, content, false) do
    case File.write(path, content, [:binary, :exclusive]) do
      :ok -> :ok
      {:error, :eexist} -> {:error, {:output_exists, path}}
      {:error, reason} -> {:error, reason}
    end
  end

  defp write_artifact(path, content, true) do
    suffix = :crypto.strong_rand_bytes(8) |> Base.url_encode64(padding: false)
    temporary = path <> ".new-" <> suffix

    with :ok <- File.write(temporary, content, [:binary, :exclusive]),
         :ok <- File.rename(temporary, path) do
      :ok
    else
      {:error, reason} ->
        File.rm(temporary)
        {:error, reason}
    end
  end

  defp metrics(result) do
    markdown = result.markdown

    %{
      bytes: byte_size(markdown),
      words: length(words(markdown)),
      headings: count(markdown, ~r/^\#{1,6}\s+/m),
      links: count(markdown, ~r/(?<!!)\[[^\]]+\]\([^\)]+\)/),
      images: count(markdown, ~r/!\[[^\]]*\]\([^\)]+\)/),
      code_blocks: div(count(markdown, ~r/^`{3,}/m), 2),
      tables: count(markdown, ~r/^\|(?:[^\n]*\|)+\s*$/m),
      issues: length(result.issues)
    }
  end

  defp assessment(static, rendered, rendered_only, similarity) do
    cond do
      rendered.words >= static.words * 1.2 and rendered_only >= 5 ->
        :rendered_has_more_content

      static.words >= rendered.words * 1.2 ->
        :static_has_more_content

      similarity >= 0.92 and abs(static.words - rendered.words) <= 5 ->
        :static_sufficient

      true ->
        :manual_review
    end
  end

  defp shared_options(options) do
    compact(
      image_policy: :link,
      allow_unsafe: true,
      max_body_bytes: options[:max_body_bytes],
      max_redirects: options[:max_redirects],
      resolver: options[:resolver],
      timeout: options[:timeout]
    )
  end

  defp report_markdown(comparison) do
    report = comparison.report

    """
    # Capture comparison

    Source: #{comparison.source_url}

    | Metric | Static | Rendered |
    |---|---:|---:|
    #{metric_row("Bytes", report.static.bytes, report.rendered.bytes)}
    #{metric_row("Words", report.static.words, report.rendered.words)}
    #{metric_row("Headings", report.static.headings, report.rendered.headings)}
    #{metric_row("Links", report.static.links, report.rendered.links)}
    #{metric_row("Images", report.static.images, report.rendered.images)}
    #{metric_row("Code blocks", report.static.code_blocks, report.rendered.code_blocks)}
    #{metric_row("Table rows", report.static.tables, report.rendered.tables)}
    #{metric_row("Validation issues", report.static.issues, report.rendered.issues)}

    Rendered-only words: #{report.rendered_only_words}

    Vocabulary similarity: #{report.vocabulary_similarity}

    Assessment: `#{report.assessment}`

    Human review is required. More text does not prove better extraction or source truth.
    """
  end

  defp metric_row(name, static, rendered), do: "| #{name} | #{static} | #{rendered} |"

  defp summarize_capture({:ok, result}) do
    {:ok,
     %{
       title: result.document.title,
       bytes: byte_size(result.markdown),
       issues: length(result.issues)
     }}
  end

  defp summarize_capture({:error, reason}), do: {:error, reason}
  defp count(text, pattern), do: length(Regex.scan(pattern, text))
  defp word_set(text), do: text |> words() |> MapSet.new()

  defp words(text) do
    ~r/[\p{L}\p{N}][\p{L}\p{N}'’-]*/u
    |> Regex.scan(String.downcase(text), capture: :first)
    |> List.flatten()
  end

  defp compact(options), do: Enum.reject(options, fn {_key, value} -> is_nil(value) end)
end
