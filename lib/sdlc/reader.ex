defmodule Sdlc.Reader do
  @moduledoc """
  Extract reader-mode content from an HTML document.
  """

  alias Sdlc.Reader.{Document, Extractor, Markdown, Rule}

  @spec convert_html(String.t(), keyword()) :: {:ok, Document.t()} | {:error, term()}
  def convert_html(html, options \\ []) when is_binary(html) do
    with {:ok, tree} <- Floki.parse_document(html),
         {:ok, content} <- Extractor.content(tree),
         {:ok, markdown} <-
           Markdown.convert(Floki.raw_html(content),
             base_url: options[:source_url],
             rules: reader_rules()
           ) do
      metadata = Extractor.metadata(tree, content)

      {:ok,
       %Document{
         title: metadata.title,
         byline: metadata.byline,
         excerpt: metadata.excerpt,
         language: metadata.language,
         published_at: metadata.published_at,
         source_url: options[:source_url],
         markdown: markdown
       }}
    else
      {:error, :no_readable_content} = error -> error
      {:error, reason} -> {:error, reason}
    end
  end

  defp reader_rules do
    [
      Rule.new(:reader_kicker, &kicker?/1, fn content, _node, _context ->
        "\n\n**#{String.trim(content)}**\n\n"
      end),
      Rule.new(:reader_figure_caption, "figcaption", fn content, _node, _context ->
        "\n\n*#{String.trim(content)}*\n\n"
      end)
    ]
  end

  defp kicker?({tag, attributes, _children}) when tag in ["div", "p"] do
    classes = attributes |> List.keyfind("class", 0, {"class", ""}) |> elem(1) |> String.split()
    Enum.any?(["upper-deck", "kicker", "eyebrow"], &(&1 in classes))
  end

  defp kicker?(_node), do: false
end
