defmodule Sdlc.Reader.Rule do
  @moduledoc """
  Defines one ordered HTML-to-Markdown conversion rule.

  A filter can be a tag name, a list of tag names, or a predicate function.
  Predicate functions receive the Floki node and can have arity one or two.
  An arity-two predicate also receives the conversion context.
  """

  @enforce_keys [:name, :filter, :replacement]
  defstruct [:name, :filter, :replacement]

  @type filter ::
          String.t()
          | atom()
          | [String.t() | atom()]
          | (Floki.html_node() -> boolean())
          | (Floki.html_node(), map() -> boolean())

  @type replacement :: (String.t(), Floki.html_node(), map() -> String.t())

  @type t :: %__MODULE__{
          name: atom(),
          filter: filter(),
          replacement: replacement()
        }

  @doc """
  Creates a conversion rule.

  Rules retain their input order. `Sdlc.Reader.Markdown` applies the first
  matching custom rule before it considers a built-in rule.
  """
  @spec new(atom(), filter(), replacement()) :: t()
  def new(name, filter, replacement)
      when is_atom(name) and is_function(replacement, 3) do
    if valid_filter?(filter) do
      %__MODULE__{name: name, filter: filter, replacement: replacement}
    else
      raise ArgumentError,
            "rule filter must be a tag, a list of tags, or a predicate with arity one or two"
    end
  end

  def new(_name, _filter, _replacement) do
    raise ArgumentError,
          "rule name must be an atom and replacement must be a function with arity three"
  end

  defp valid_filter?(filter) when is_binary(filter) or is_atom(filter), do: true

  defp valid_filter?(filter) when is_list(filter) do
    filter != [] and Enum.all?(filter, &(is_binary(&1) or is_atom(&1)))
  end

  defp valid_filter?(filter), do: is_function(filter, 1) or is_function(filter, 2)
end
