defmodule Sdlc.Reader.Address do
  @moduledoc "Validation for public IP destinations used by the reader."

  import Bitwise

  @spec public?(:inet.ip_address()) :: boolean()
  def public?(address) do
    valid?(address) and not special?(address)
  end

  @spec valid?(term()) :: boolean()
  def valid?({a, b, c, d}),
    do: Enum.all?([a, b, c, d], &(is_integer(&1) and &1 in 0..255))

  def valid?({a, b, c, d, e, f, g, h}),
    do: Enum.all?([a, b, c, d, e, f, g, h], &(is_integer(&1) and &1 in 0..65_535))

  def valid?(_address), do: false

  defp special?({a, b, c, d}) do
    a == 0 or
      a == 10 or
      a == 127 or
      a >= 224 or
      (a == 100 and b in 64..127) or
      (a == 169 and b == 254) or
      (a == 172 and b in 16..31) or
      (a == 192 and b == 0 and c in [0, 2]) or
      (a == 192 and b == 88 and c == 99) or
      (a == 192 and b == 168) or
      (a == 198 and b in [18, 19]) or
      (a == 198 and b == 51 and c == 100) or
      (a == 203 and b == 0 and c == 113) or
      (a == 255 and b == 255 and c == 255 and d == 255)
  end

  defp special?({a, b, _c, _d, _e, _f, _g, _h}) do
    not global_unicast?(a) or
      (a == 0x2001 and b <= 0x01FF) or
      (a == 0x2001 and b == 0x0DB8) or
      a == 0x2002 or
      (a &&& 0xFFF0) == 0x3FF0
  end

  defp global_unicast?(first_segment), do: (first_segment &&& 0xE000) == 0x2000
end
