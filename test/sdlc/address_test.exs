defmodule Sdlc.Reader.AddressTest do
  use ExUnit.Case, async: true

  alias Sdlc.Reader.Address

  test "accepts ordinary globally reachable addresses" do
    assert Address.public?({93, 184, 216, 34})
    assert Address.public?({192, 0, 1, 1})
    assert Address.public?({198, 51, 1, 1})
    assert Address.public?({203, 0, 1, 1})
    assert Address.public?(parse!("2606:4700:4700::1111"))
  end

  test "rejects special-use IPv4 addresses" do
    refute Address.public?({10, 0, 0, 1})
    refute Address.public?({100, 64, 0, 1})
    refute Address.public?({127, 0, 0, 1})
    refute Address.public?({169, 254, 1, 1})
    refute Address.public?({172, 31, 1, 1})
    refute Address.public?({192, 0, 2, 1})
    refute Address.public?({192, 168, 1, 1})
    refute Address.public?({198, 18, 1, 1})
    refute Address.public?({198, 51, 100, 1})
    refute Address.public?({203, 0, 113, 1})
    refute Address.public?({224, 0, 0, 1})
  end

  test "rejects local, transition, multicast, and documentation IPv6 addresses" do
    refute Address.public?(parse!("::1"))
    refute Address.public?(parse!("fc00::1"))
    refute Address.public?(parse!("fe80::1"))
    refute Address.public?(parse!("ff02::1"))
    refute Address.public?(parse!("2001:db8::1"))
    refute Address.public?(parse!("2002:7f00:1::1"))
    refute Address.public?(parse!("::ffff:127.0.0.1"))
  end

  defp parse!(text) do
    {:ok, address} = :inet.parse_address(String.to_charlist(text))
    address
  end
end
