defmodule Sdlc.Reader.CLITest do
  use ExUnit.Case, async: true

  alias Sdlc.Reader.CLI
  alias Sdlc.Reader.Renderer.Chrome

  defmodule FakeCapture do
    def capture(url, options) do
      send(self(), {:capture, url, options})
      {:ok, %{capture: true}}
    end

    def write(result, output, options) do
      send(self(), {:write, result, output, options})
      {:ok, output}
    end
  end

  test "maps rendered capture and local image options" do
    output = Path.expand("../../_build/test/cli/article.md", __DIR__)

    assert {:ok, ^output} =
             CLI.run(
               [
                 "https://example.test/article",
                 "--output",
                 output,
                 "--canonical-id",
                 "example-article",
                 "--images",
                 "local",
                 "--assets-dir",
                 "assets/article",
                 "--image-license",
                 "CC-BY-4.0",
                 "--license",
                 "CC-BY-4.0",
                 "--render",
                 "--isolation-confirmed",
                 "--chrome",
                 "/verified/chrome",
                 "--virtual-time-budget",
                 "8000"
               ],
               capture: FakeCapture
             )

    assert_receive {:capture, "https://example.test/article", capture_options}
    assert capture_options[:renderer] == Chrome
    assert capture_options[:chrome_path] == "/verified/chrome"
    assert capture_options[:virtual_time_budget] == 8_000
    assert capture_options[:image_policy] == :local
    assert capture_options[:assets_dir] == "assets/article"
    assert capture_options[:image_license] == "CC-BY-4.0"

    assert capture_options[:asset_path_prefix] ==
             Path.relative_to(Path.expand("assets/article"), Path.dirname(output))

    assert_receive {:write, %{capture: true}, ^output, write_options}
    assert write_options[:canonical_id] == "example-article"
    assert write_options[:license] == "CC-BY-4.0"
  end

  test "requires an explicit output and canonical identifier" do
    assert {:error, {:missing_option, :output}} =
             CLI.run(["https://example.test/article"], capture: FakeCapture)
  end

  test "rejects an existing output unless force is set" do
    output = Path.expand("../../_build/test/cli/existing.md", __DIR__)
    File.mkdir_p!(Path.dirname(output))
    File.write!(output, "keep")

    assert {:error, {:output_exists, ^output}} =
             CLI.run(
               [
                 "https://example.test/article",
                 "--output",
                 output,
                 "--canonical-id",
                 "example-article"
               ],
               capture: FakeCapture
             )
  end
end
