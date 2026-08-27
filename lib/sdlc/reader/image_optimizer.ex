defmodule Sdlc.Reader.ImageOptimizer do
  @moduledoc """
  Produces deterministic, display-safe raster image copies for Markdown readers.

  The optimizer accepts only PNG, JPEG, and WebP input. It does not parse SVG,
  GIF, or other active or unsupported formats.
  """

  alias Vix.Vips.Image, as: Vimage

  @default_max_dimension 1_600
  @default_max_input_bytes 25 * 1_024 * 1_024
  @default_max_pixels 40_000_000
  @default_max_source_dimension 20_000
  @default_quality 85
  @preserved_metadata ~w(artist copyright creator credit rights)

  @type result :: %{
          path: Path.t(),
          width: pos_integer(),
          height: pos_integer(),
          input_bytes: non_neg_integer(),
          output_bytes: non_neg_integer(),
          created: boolean()
        }

  @doc """
  Resize and encode a raster image for a local Markdown asset directory.

  The output name contains a SHA-256 hash of the source URL and body. This
  makes repeat runs deterministic and prevents unrelated source URLs from
  sharing an asset name.
  """
  @spec optimize(binary(), keyword()) :: {:ok, result()} | {:error, atom() | term()}
  def optimize(binary, options) when is_binary(binary) and is_list(options) do
    with :ok <- validate_input_size(binary, options),
         {:ok, suffix} <- output_suffix(binary, options),
         {:ok, output_dir} <- output_dir(options),
         {:ok, image} <- open_raster(binary),
         {:ok, image} <- normalize_image(image, options),
         {:ok, encoded} <- encode(image, suffix, options),
         {:ok, path, created} <- write_output(encoded, suffix, binary, options, output_dir) do
      {:ok,
       %{
         path: path,
         width: Image.width(image),
         height: Image.height(image),
         input_bytes: byte_size(binary),
         output_bytes: byte_size(encoded),
         created: created
       }}
    end
  rescue
    error in [Image.Error, ArgumentError] -> {:error, {:image_processing_failed, error.message}}
  end

  def optimize(_binary, _options), do: {:error, :invalid_image}

  defp validate_input_size(binary, options) do
    max_input_bytes = Keyword.get(options, :max_input_bytes, @default_max_input_bytes)

    if is_integer(max_input_bytes) and max_input_bytes > 0 and
         byte_size(binary) <= max_input_bytes do
      :ok
    else
      {:error, :image_too_large}
    end
  end

  defp output_dir(options) do
    case Keyword.fetch(options, :output_dir) do
      {:ok, path} when is_binary(path) and path != "" ->
        case File.mkdir_p(path) do
          :ok -> {:ok, path}
          {:error, reason} -> {:error, reason}
        end

      _ ->
        {:error, :missing_output_dir}
    end
  end

  defp output_suffix(binary, options) do
    content_type = options |> Keyword.get(:content_type, "") |> normalize_content_type()
    declared_suffix = content_type_suffix(content_type)
    detected_suffix = magic_suffix(binary)

    cond do
      detected_suffix not in [".png", ".jpg", ".webp"] ->
        {:error, :unsupported_image_type}

      declared_suffix != nil and declared_suffix != detected_suffix ->
        {:error, :image_type_mismatch}

      true ->
        {:ok, detected_suffix}
    end
  end

  defp normalize_content_type(content_type) when is_binary(content_type) do
    content_type
    |> String.split(";", parts: 2)
    |> hd()
    |> String.trim()
    |> String.downcase()
  end

  defp normalize_content_type(_), do: ""

  defp content_type_suffix("image/png"), do: ".png"
  defp content_type_suffix("image/jpeg"), do: ".jpg"
  defp content_type_suffix("image/jpg"), do: ".jpg"
  defp content_type_suffix("image/webp"), do: ".webp"
  defp content_type_suffix(_), do: nil

  defp magic_suffix(<<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _::binary>>), do: ".png"
  defp magic_suffix(<<0xFF, 0xD8, 0xFF, _::binary>>), do: ".jpg"
  defp magic_suffix(<<"RIFF", _::binary-size(4), "WEBP", _::binary>>), do: ".webp"
  defp magic_suffix(_), do: nil

  defp open_raster(binary) do
    case Image.open(binary, access: :sequential) do
      {:ok, image} -> {:ok, image}
      {:error, _reason} -> {:error, :invalid_image}
    end
  end

  defp normalize_image(image, options) do
    max_dimension = Keyword.get(options, :max_dimension, @default_max_dimension)

    with :ok <- valid_max_dimension(max_dimension),
         :ok <- validate_source_dimensions(image, options),
         {:ok, {image, _rotation}} <- Image.autorotate(image) do
      image = prune_metadata(image)
      scale = max_dimension / max(Image.width(image), Image.height(image))

      if scale < 1 do
        Image.resize(image, scale)
      else
        {:ok, image}
      end
    end
  end

  defp valid_max_dimension(value) when is_integer(value) and value > 0, do: :ok
  defp valid_max_dimension(_), do: {:error, :invalid_max_dimension}

  defp validate_source_dimensions(image, options) do
    width = Image.width(image)
    height = Image.height(image)
    max_pixels = Keyword.get(options, :max_pixels, @default_max_pixels)

    max_source_dimension =
      Keyword.get(options, :max_source_dimension, @default_max_source_dimension)

    cond do
      not is_integer(max_pixels) or max_pixels <= 0 ->
        {:error, :invalid_max_pixels}

      not is_integer(max_source_dimension) or max_source_dimension <= 0 ->
        {:error, :invalid_max_source_dimension}

      width > max_source_dimension or height > max_source_dimension ->
        {:error, :image_dimensions_too_large}

      width * height > max_pixels ->
        {:error, :image_dimensions_too_large}

      true ->
        :ok
    end
  end

  # Keep direct author and rights fields when libvips exposes them. Embedded
  # EXIF, IPTC, and XMP blocks are removed because they cannot be safely reduced
  # field-by-field without retaining unrelated metadata.
  defp prune_metadata(image) do
    with {:ok, fields} <- Vimage.header_field_names(image),
         removable <- Enum.reject(fields, &preserve_metadata?/1),
         {:ok, cleaned} <- Image.remove_metadata(image, removable) do
      cleaned
    else
      _ -> image
    end
  end

  defp preserve_metadata?(field) do
    field = String.downcase(field)
    Enum.any?(@preserved_metadata, &String.contains?(field, &1))
  end

  defp encode(image, suffix, options) do
    quality = Keyword.get(options, :quality, @default_quality)

    if is_integer(quality) and quality in 1..100 do
      Image.write(image, :memory, encoder_options(suffix, quality))
    else
      {:error, :invalid_quality}
    end
  end

  defp encoder_options(".png", _quality), do: [suffix: ".png", compression: 9, effort: 8]

  defp encoder_options(".jpg", quality),
    do: [suffix: ".jpg", quality: quality, minimize_file_size: true]

  defp encoder_options(".webp", quality),
    do: [suffix: ".webp", quality: quality, effort: 8, minimize_file_size: true]

  defp write_output(encoded, suffix, binary, options, output_dir) do
    source_url = Keyword.get(options, :source_url, "")
    name = :crypto.hash(:sha256, [source_url, <<0>>, binary]) |> Base.encode16(case: :lower)
    path = Path.join(output_dir, name <> suffix)
    existed = File.exists?(path)

    case File.write(path, encoded, [:binary]) do
      :ok -> {:ok, path, not existed}
      {:error, reason} -> {:error, reason}
    end
  end
end
