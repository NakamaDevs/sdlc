defmodule Sdlc.ReaderTest do
  use ExUnit.Case, async: true

  alias Sdlc.Reader

  @fixture Path.expand("../fixtures/reader_article.html", __DIR__)

  test "extracts article content and removes promotional content" do
    html = File.read!(@fixture)

    assert {:ok, document} =
             Reader.convert_html(html,
               source_url: "https://news.example.test/articles/reader-mode"
             )

    assert document.title == "A useful reader-mode article"
    assert document.byline == "Example Author"
    assert document.excerpt == "A focused article fixture."
    assert document.language == "en"
    assert document.published_at == ~D[2026-08-26]
    assert document.markdown =~ "**reader evidence**\n\n# A useful reader-mode article"
    assert document.markdown =~ "# A useful reader-mode article"
    assert document.markdown =~ "supporting evidence](https://news.example.test/evidence)"

    assert document.markdown =~
             ~s|![Robots working at laptops](https://news.example.test/images/robots-at-work.jpg "Automation in context")|

    assert document.markdown =~ "*Robots demonstrate the article context.*"

    assert document.markdown =~
             ~s|"Automation in context")\n\n*Robots demonstrate the article context.*|

    refute document.markdown =~ "Buy this promoted product"
    refute document.markdown =~ "Subscribe"
    refute document.markdown =~ "Related promotional stories"
    refute document.markdown =~ "Menu Pricing Shop"
    refute document.markdown =~ "Ars Video"
    refute document.markdown =~ "promoted video inserted"
    refute document.markdown =~ "robots-at-work-small"
    refute document.markdown =~ "Duplicate lightbox credit"
    refute document.markdown =~ "Repeated author biography"
  end

  test "returns an error when no useful content exists" do
    assert {:error, :no_readable_content} =
             Reader.convert_html("<html><body><nav>Only navigation</nav></body></html>",
               source_url: "https://example.test"
             )
  end

  test "does not remove article content because the body reports a modal state" do
    html = """
    <html lang="en">
      <body class="site fides-overlay-modal-link-shown">
        <article>
          <h1>Rendered article</h1>
          <p>This paragraph contains the stable source context needed for reader selection.</p>
          <p>This paragraph contains enough additional evidence for a useful article result.</p>
        </article>
      </body>
    </html>
    """

    assert {:ok, document} = Reader.convert_html(html, source_url: "https://example.test")
    assert document.markdown =~ "# Rendered article"
    assert document.markdown =~ "stable source context"
  end
end
