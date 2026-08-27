defmodule Sdlc.Reader.URL do
  @moduledoc "Validation and safe resolution for reader-mode URLs."

  alias Sdlc.Reader.Address

  @http_schemes ["http", "https"]

  @spec validate(binary()) :: {:ok, URI.t()} | {:error, atom()}
  def validate(url) when is_binary(url) do
    uri = URI.parse(String.trim(url))
    scheme = normalize(uri.scheme)

    cond do
      scheme not in @http_schemes -> {:error, :unsupported_scheme}
      not is_binary(uri.host) or uri.host == "" -> {:error, :missing_host}
      is_binary(uri.userinfo) and uri.userinfo != "" -> {:error, :userinfo_not_allowed}
      private_literal?(uri.host) -> {:error, :private_address}
      true -> {:ok, uri}
    end
  end

  def validate(_url), do: {:error, :invalid_url}

  @spec resolve(binary(), binary()) :: binary() | nil
  def resolve(relative, base) when is_binary(relative) and is_binary(base) do
    with {:ok, base_uri} <- validate(base),
         target <- URI.merge(base_uri, String.trim(relative)),
         {:ok, target_uri} <- validate(URI.to_string(target)) do
      URI.to_string(target_uri)
    else
      _ -> nil
    end
  end

  def resolve(_relative, _base), do: nil

  @spec safe_link(binary(), binary()) :: binary() | nil
  def safe_link(link, base) when is_binary(link) and is_binary(base) do
    link = String.trim(link)

    cond do
      link == "" ->
        nil

      active_scheme?(link) ->
        nil

      true ->
        case resolve(link, base) do
          resolved when is_binary(resolved) -> resolved
          _ -> nil
        end
    end
  end

  def safe_link(_link, _base), do: nil

  defp normalize(nil), do: nil
  defp normalize(value), do: String.downcase(value)

  defp active_scheme?(value) do
    case Regex.run(~r/^([a-z][a-z0-9+.-]*):/i, value, capture: :all_but_first) do
      [scheme] -> String.downcase(scheme) not in @http_schemes
      _ -> false
    end
  end

  defp private_literal?(host) do
    host = String.trim(host, "[]")

    case :inet.parse_address(String.to_charlist(host)) do
      {:ok, address} -> not Address.public?(address)
      {:error, _} -> false
    end
  end
end
