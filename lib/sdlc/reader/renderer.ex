defmodule Sdlc.Reader.Renderer do
  @moduledoc """
  Contract for an opt-in browser renderer.

  A renderer executes untrusted page JavaScript. Run it in a disposable,
  network-restricted environment when the source is not trusted.
  """

  @callback render(String.t(), keyword()) :: {:ok, map()} | {:error, term()}
end
