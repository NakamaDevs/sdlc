defmodule Sdlc.Reader.ComparisonTest do
  use ExUnit.Case, async: true

  alias Sdlc.Reader.{Capture, Comparison, Document}
  alias Sdlc.Reader.Renderer.Chrome

  defmodule FakeCapture do
    alias Sdlc.Reader.{Capture, Document}

    def capture(url, options) do
      mode = if options[:renderer], do: :rendered, else: :static
      send(self(), {:capture_mode, mode, options})

      extra =
        if mode == :rendered do
          "\n\nDynamic evidence adds several useful words after the client request completes."
        else
          ""
        end

      markdown = "# Example\n\nA short article body with stable source facts.#{extra}\n"
      document = %Document{title: "Example", source_url: url, markdown: markdown}

      {:ok,
       %Capture.Result{
         source_url: url,
         document: document,
         markdown: markdown,
         issues: [],
         images: []
       }}
    end
  end

  test "reports structural and text differences without declaring truth" do
    static = result("# Example\n\nOne stable paragraph with source facts.\n")

    rendered =
      result(
        "# Example\n\nOne stable paragraph with source facts.\n\n" <>
          "Dynamic evidence adds several useful words after the client request completes.\n"
      )

    report = Comparison.compare(static, rendered)

    assert report.rendered.words > report.static.words
    assert report.rendered.headings == 1
    assert report.rendered_only_words >= 6
    assert report.assessment == :rendered_has_more_content
    assert report.requires_human_review
  end

  test "captures static and rendered variants with the same reader" do
    assert {:ok, comparison} =
             Comparison.capture("https://example.test/article",
               capture: FakeCapture,
               chrome_path: "/verified/chrome",
               isolation_confirmed: true
             )

    assert comparison.report.rendered.words > comparison.report.static.words
    assert comparison.static.markdown =~ "stable source facts"
    assert comparison.rendered.markdown =~ "Dynamic evidence"

    assert_receive {:capture_mode, :static, static_options}
    refute static_options[:renderer]

    assert_receive {:capture_mode, :rendered, rendered_options}
    assert rendered_options[:renderer] == Chrome
    assert rendered_options[:chrome_path] == "/verified/chrome"
    assert rendered_options[:isolation_confirmed]
  end

  test "refuses to replace comparison artifacts without explicit overwrite" do
    output_dir = Path.expand("../../_build/test/comparison-output", __DIR__)
    File.rm_rf!(output_dir)
    File.mkdir_p!(output_dir)
    File.write!(Path.join(output_dir, "static.md"), "keep")

    static = result("# Static\n")
    rendered = result("# Rendered\n")

    comparison = %{
      source_url: "https://example.test",
      static: static,
      rendered: rendered,
      report: Comparison.compare(static, rendered)
    }

    assert {:error, {:output_exists, _path}} =
             Comparison.write_artifacts(comparison, output_dir)

    assert File.read!(Path.join(output_dir, "static.md")) == "keep"

    assert {:ok, ^output_dir} =
             Comparison.write_artifacts(comparison, output_dir, overwrite: true)

    assert File.read!(Path.join(output_dir, "static.md")) == "# Static\n"
  end

  defp result(markdown) do
    document = %Document{title: "Example", source_url: "https://example.test", markdown: markdown}

    %Capture.Result{
      source_url: "https://example.test",
      document: document,
      markdown: markdown,
      issues: [],
      images: []
    }
  end
end
