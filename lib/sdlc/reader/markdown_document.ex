defmodule Sdlc.Reader.MarkdownDocument do
  @moduledoc false

  @type line_kind :: :outside | :inside | :fence
  @type annotated_line :: {line_kind(), String.t()}
  @type fence :: {String.t(), pos_integer()}

  @doc false
  @spec normalize(binary()) :: binary()
  def normalize(markdown) when is_binary(markdown) do
    content =
      markdown
      |> annotated_lines()
      |> collapse_outside_blank_lines()
      |> trim_outer_blank_lines()
      |> Enum.map_join("\n", &elem(&1, 1))

    cond do
      content == "" -> ""
      String.ends_with?(content, "\n") -> content
      true -> content <> "\n"
    end
  end

  @doc false
  @spec excess_blank_lines?(binary()) :: boolean()
  def excess_blank_lines?(markdown) when is_binary(markdown) do
    markdown
    |> annotated_lines()
    |> Enum.map_join("\n", fn
      {:outside, line} -> line
      {_kind, _line} -> "content"
    end)
    |> then(&Regex.match?(~r/\n{4,}/, &1))
  end

  def excess_blank_lines?(_markdown), do: false

  defp annotated_lines(markdown) do
    {lines, _fence} =
      markdown
      |> String.split("\n", trim: false)
      |> Enum.map_reduce(nil, &annotate_line/2)

    lines
  end

  defp annotate_line(line, nil) do
    line = String.trim_trailing(line, " \t")

    case opening_fence(line) do
      {:ok, fence} -> {{:fence, line}, fence}
      :error -> {{:outside, line}, nil}
    end
  end

  defp annotate_line(line, fence) do
    if closing_fence?(line, fence) do
      {{:fence, String.trim_trailing(line, " \t")}, nil}
    else
      {{:inside, line}, fence}
    end
  end

  defp opening_fence(line) do
    case Regex.run(~r/^[ \t]*(`{3,}|~{3,})/u, line, capture: :all_but_first) do
      [marker] -> {:ok, {String.first(marker), String.length(marker)}}
      _ -> :error
    end
  end

  defp closing_fence?(line, {marker, minimum_length}) do
    candidate = String.trim(line, " \t")

    String.length(candidate) >= minimum_length and
      candidate |> String.graphemes() |> Enum.all?(&(&1 == marker))
  end

  defp collapse_outside_blank_lines(lines) do
    {collapsed, _blank_lines} =
      Enum.reduce(lines, {[], 0}, fn
        {:outside, ""} = line, {result, 0} -> {[line | result], 1}
        {:outside, ""}, {result, blank_lines} -> {result, blank_lines}
        line, {result, _blank_lines} -> {[line | result], 0}
      end)

    Enum.reverse(collapsed)
  end

  defp trim_outer_blank_lines(lines) do
    lines
    |> Enum.drop_while(&match?({:outside, ""}, &1))
    |> Enum.reverse()
    |> Enum.drop_while(&match?({:outside, ""}, &1))
    |> Enum.reverse()
  end
end
