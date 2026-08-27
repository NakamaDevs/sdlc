defmodule Sdlc.Reader.Document do
  @moduledoc """
  The reader-mode result for one HTML document.
  """

  @enforce_keys [:markdown]
  defstruct [:title, :byline, :excerpt, :language, :published_at, :source_url, :markdown]

  @type t :: %__MODULE__{
          title: String.t() | nil,
          byline: String.t() | nil,
          excerpt: String.t() | nil,
          language: String.t() | nil,
          published_at: Date.t() | nil,
          source_url: String.t() | nil,
          markdown: String.t()
        }
end
