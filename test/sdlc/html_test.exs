defmodule Sdlc.Reader.HTMLTest do
  use ExUnit.Case, async: true

  alias Sdlc.Reader.HTML

  test "sniffs a bounded ASCII prefix without decoding the full body" do
    body = " \n<!DoCtYpE HTML><body>caf" <> <<0xE9>> <> "</body>"

    assert HTML.document?(body)
    refute HTML.document?(String.duplicate(" ", 513) <> "<html>")
  end
end
