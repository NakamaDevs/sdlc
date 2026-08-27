defmodule Sdlc.Reader.Validator do
  @moduledoc "Deterministic checks for unsafe or malformed Markdown input."

  alias Sdlc.Reader.{MarkdownDocument, PromptScanner}

  @empty_link ~r/!?(?:\[[^\]]*\])\(\s*\)/

  @spec validate(binary()) :: {:ok, []} | {:error, [map()]}
  def validate(markdown) when is_binary(markdown) do
    issues =
      markdown
      |> PromptScanner.scan()
      |> Enum.map(&%{kind: &1.kind})
      |> Enum.uniq()
      |> add_if(:empty_link_target, Regex.match?(@empty_link, markdown))
      |> add_if(:excess_blank_lines, MarkdownDocument.excess_blank_lines?(markdown))

    case issues do
      [] -> {:ok, []}
      issues -> {:error, issues}
    end
  end

  def validate(_markdown), do: {:error, [%{kind: :invalid_input}]}

  defp add_if(issues, _kind, false), do: issues
  defp add_if(issues, kind, true), do: issues ++ [%{kind: kind}]
end
