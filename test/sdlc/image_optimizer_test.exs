defmodule Sdlc.Reader.ImageOptimizerTest do
  use ExUnit.Case, async: false

  alias Sdlc.Reader.ImageOptimizer

  @output_dir Path.expand("../../_build/test/optimized-images", __DIR__)

  setup do
    File.rm_rf!(@output_dir)
    File.mkdir_p!(@output_dir)
    :ok
  end

  test "reduces large images without changing their aspect ratio" do
    source = Image.new!(2400, 1200, color: [210, 220, 230])
    {:ok, binary} = Image.write(source, :memory, suffix: ".png")

    assert {:ok, result} =
             ImageOptimizer.optimize(binary,
               source_url: "https://images.example.test/robots.png",
               content_type: "image/png",
               output_dir: @output_dir,
               max_dimension: 1600,
               quality: 85
             )

    assert result.width == 1600
    assert result.height == 800
    assert result.output_bytes <= result.input_bytes
    assert File.exists?(result.path)
    assert Path.extname(result.path) == ".png"
  end

  test "rejects unsupported active image formats" do
    assert {:error, :unsupported_image_type} =
             ImageOptimizer.optimize("<svg><script>alert(1)</script></svg>",
               source_url: "https://images.example.test/image.svg",
               content_type: "image/svg+xml",
               output_dir: @output_dir
             )
  end

  test "rejects active image content with a false raster content type" do
    assert {:error, :unsupported_image_type} =
             ImageOptimizer.optimize("<svg><script>alert(1)</script></svg>",
               source_url: "https://images.example.test/image.png",
               content_type: "image/png",
               output_dir: @output_dir
             )
  end

  test "rejects a raster body that differs from its declared content type" do
    source = Image.new!(2, 2, color: [210, 220, 230])
    {:ok, binary} = Image.write(source, :memory, suffix: ".png")

    assert {:error, :image_type_mismatch} =
             ImageOptimizer.optimize(binary,
               source_url: "https://images.example.test/image.jpg",
               content_type: "image/jpeg",
               output_dir: @output_dir
             )
  end

  test "rejects source dimensions above the configured pixel budget" do
    source = Image.new!(100, 100, color: [210, 220, 230])
    {:ok, binary} = Image.write(source, :memory, suffix: ".png")

    assert {:error, :image_dimensions_too_large} =
             ImageOptimizer.optimize(binary,
               source_url: "https://images.example.test/image.png",
               content_type: "image/png",
               output_dir: @output_dir,
               max_pixels: 1_000
             )
  end
end
