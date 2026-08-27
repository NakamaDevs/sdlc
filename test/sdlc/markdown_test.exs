defmodule Sdlc.Reader.MarkdownTest do
  use ExUnit.Case, async: true

  alias Sdlc.Reader.Markdown
  alias Sdlc.Reader.Rule

  test "converts CommonMark and GFM structures" do
    html = """
    <h2>Format</h2>
    <p>Use <strong>clear</strong> text with <code>a`b</code>.</p>
    <ol start="3"><li>First<ul><li>Nested</li></ul></li><li>Second</li></ol>
    <blockquote><p>Keep this quote.</p></blockquote>
    <pre><code class="language-elixir">IO.puts(```)</code></pre>
    <table><thead><tr><th>Name</th><th>Result</th></tr></thead><tbody><tr><td>A</td><td>Pass | safe</td></tr></tbody></table>
    """

    assert {:ok, markdown} = Markdown.convert(html, base_url: "https://example.test/base/")

    assert markdown =~ "## Format"
    assert markdown =~ "**clear**"
    assert markdown =~ "`` a`b ``"
    assert markdown =~ "3. First"
    assert markdown =~ "- Nested"
    assert markdown =~ "> Keep this quote."
    assert markdown =~ "````elixir\nIO.puts(```)\n````"
    assert markdown =~ "| Name | Result |"
    assert markdown =~ ~S(| A | Pass \| safe |)
  end

  test "gives custom rules precedence over built-in rules" do
    rule = Rule.new(:highlight, "mark", fn content, _node, _context -> "==#{content}==" end)

    assert {:ok, "Keep ==this== value.\n"} =
             Markdown.convert("<p>Keep <mark>this</mark> value.</p>", rules: [rule])
  end

  test "preserves link titles and rejects non-HTTP image sources" do
    html = """
    <p><a href="/guide" title="Reader guide">Read the guide</a>.</p>
    <img src="mailto:person@example.test" alt="Unsafe image source">
    """

    assert {:ok, markdown} = Markdown.convert(html, base_url: "https://example.test/base/")

    assert markdown =~ ~s|[Read the guide](https://example.test/guide "Reader guide")|
    assert markdown =~ "Unsafe image source"
    refute markdown =~ "!["
    refute markdown =~ "mailto:"
  end

  test "rejects links and images with private literal destinations" do
    html = """
    <p><a href="http://127.0.0.1/admin">Local admin</a></p>
    <img src="http://169.254.169.254/latest/meta-data" alt="Metadata service">
    """

    assert {:ok, markdown} = Markdown.convert(html, base_url: "https://example.test/")

    assert markdown =~ "Local admin"
    assert markdown =~ "Metadata service"
    refute markdown =~ "127.0.0.1"
    refute markdown =~ "169.254.169.254"
    refute markdown =~ "!["
  end

  test "preserves trailing spaces and blank lines inside fenced code" do
    html = "<pre><code>first  \n\n\n\nsecond\t \n</code></pre>"

    assert {:ok, markdown} = Markdown.convert(html)
    assert markdown == "```\nfirst  \n\n\n\nsecond\t \n```\n"
  end
end
