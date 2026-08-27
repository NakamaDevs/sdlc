defmodule Sdlc.Reader.FetcherTest do
  use ExUnit.Case, async: true

  alias Sdlc.Reader.Fetcher

  test "collects a bounded response body" do
    assert {:ok, "abcde"} = Fetcher.collect_body(["abc", "de"], 5)
    assert {:error, :body_too_large} = Fetcher.collect_body(["abc", "def"], 5)
  end

  test "rejects private resolved addresses" do
    assert :ok = Fetcher.validate_addresses([{93, 184, 216, 34}])
    assert {:error, :private_address} = Fetcher.validate_addresses([{10, 0, 0, 1}])
    assert {:error, :private_address} = Fetcher.validate_addresses([{0, 0, 0, 0, 0, 0, 0, 1}])
  end

  test "checks every address returned by DNS" do
    resolver = fn "example.test" -> {:ok, [{93, 184, 216, 34}, {192, 168, 1, 2}]} end

    assert {:error, :private_address} =
             Fetcher.validate_destination("https://example.test/article", resolver: resolver)
  end
end
