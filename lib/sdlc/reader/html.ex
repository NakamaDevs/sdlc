defmodule Sdlc.Reader.HTML do
  @moduledoc false

  @sniff_bytes 512
  @whitespace [9, 10, 12, 13, 32]

  @doc false
  @spec document?(binary()) :: boolean()
  def document?(body) when is_binary(body) do
    body
    |> binary_part(0, min(byte_size(body), @sniff_bytes))
    |> trim_ascii_whitespace()
    |> then(&(ascii_prefix?(&1, "<!doctype html") or ascii_prefix?(&1, "<html")))
  end

  def document?(_body), do: false

  defp trim_ascii_whitespace(<<character, rest::binary>>) when character in @whitespace,
    do: trim_ascii_whitespace(rest)

  defp trim_ascii_whitespace(value), do: value

  defp ascii_prefix?(_value, ""), do: true
  defp ascii_prefix?("", _expected), do: false

  defp ascii_prefix?(<<actual, rest::binary>>, <<expected, expected_rest::binary>>) do
    if ascii_downcase(actual) == expected do
      ascii_prefix?(rest, expected_rest)
    else
      false
    end
  end

  defp ascii_downcase(character) when character in ?A..?Z, do: character + 32
  defp ascii_downcase(character), do: character
end
