defmodule Sdlc.Reader.Fetcher do
  @moduledoc """
  Fetches bounded public HTTP resources for the reader pipeline.

  The fetcher validates every redirect and pins each request to one validated
  address. This reduces DNS rebinding and server-side request forgery risks.
  """

  alias Sdlc.Reader.{Address, URL}

  @default_max_body_bytes 5 * 1024 * 1024
  @default_max_redirects 5
  @default_timeout 15_000
  @user_agent "NakamaDevs-sdlc-reader/0.1 (+https://github.com/NakamaDevs/sdlc)"
  @redirect_statuses [301, 302, 303, 307, 308]

  @type response :: %{
          required(:url) => String.t(),
          required(:status) => pos_integer(),
          required(:headers) => map(),
          required(:content_type) => String.t() | nil,
          required(:body) => binary()
        }

  @spec fetch(String.t(), keyword()) :: {:ok, response()} | {:error, term()}
  def fetch(url, options \\ []) when is_binary(url) do
    max_redirects = Keyword.get(options, :max_redirects, @default_max_redirects)
    do_fetch(url, options, max_redirects)
  end

  @doc false
  @spec collect_body(Enumerable.t(), non_neg_integer()) ::
          {:ok, binary()} | {:error, :body_too_large}
  def collect_body(chunks, max_bytes) when is_integer(max_bytes) and max_bytes >= 0 do
    Enum.reduce_while(chunks, {0, []}, fn chunk, {size, collected} ->
      next_size = size + byte_size(chunk)

      if next_size > max_bytes do
        {:halt, {:error, :body_too_large}}
      else
        {:cont, {next_size, [chunk | collected]}}
      end
    end)
    |> case do
      {:error, :body_too_large} = error -> error
      {_size, collected} -> {:ok, collected |> Enum.reverse() |> IO.iodata_to_binary()}
    end
  end

  @doc false
  @spec validate_destination(String.t(), keyword()) ::
          {:ok, URI.t(), [:inet.ip_address()]} | {:error, term()}
  def validate_destination(url, options \\ []) do
    resolver = Keyword.get(options, :resolver, &resolve_public_addresses/1)

    with {:ok, uri} <- URL.validate(url),
         {:ok, addresses} <- resolver.(uri.host),
         :ok <- validate_addresses(addresses) do
      {:ok, uri, addresses}
    end
  end

  @doc false
  @spec validate_addresses([:inet.ip_address()]) :: :ok | {:error, term()}
  def validate_addresses([]), do: {:error, :dns_not_found}

  def validate_addresses(addresses) when is_list(addresses) do
    cond do
      Enum.any?(addresses, &(not Address.valid?(&1))) -> {:error, :invalid_address}
      Enum.any?(addresses, &(not Address.public?(&1))) -> {:error, :private_address}
      true -> :ok
    end
  end

  defp do_fetch(_url, _options, redirects_left) when redirects_left < 0,
    do: {:error, :too_many_redirects}

  defp do_fetch(url, options, redirects_left) do
    resolver = Keyword.get(options, :resolver, &resolve_public_addresses/1)

    with {:ok, uri, addresses} <- validate_destination(url, resolver: resolver),
         {:ok, response} <- request_once(uri, hd(addresses), options) do
      follow_response(response, uri, options, redirects_left)
    end
  end

  defp request_once(uri, address, options) do
    max_bytes = Keyword.get(options, :max_body_bytes, @default_max_body_bytes)
    timeout = Keyword.get(options, :timeout, @default_timeout)
    request_uri = pin_uri(uri, address)
    into = bounded_collector(max_bytes)

    headers = [
      {"accept", Keyword.get(options, :accept, "text/html,application/xhtml+xml,image/*;q=0.8")},
      {"accept-encoding", "identity"},
      {"user-agent", Keyword.get(options, :user_agent, @user_agent)}
    ]

    case Req.get(request_uri,
           headers: headers,
           redirect: false,
           compressed: false,
           decode_body: false,
           raw: true,
           into: into,
           receive_timeout: timeout,
           connect_options: [hostname: uri.host, timeout: timeout]
         ) do
      {:ok, response} -> normalize_response(response, URI.to_string(uri))
      {:error, reason} -> {:error, {:request_failed, reason}}
    end
  rescue
    error -> {:error, {:request_failed, error}}
  end

  defp bounded_collector(max_bytes) do
    fn {:data, data}, {request, response} ->
      size = Req.Response.get_private(response, :sdlc_reader_body_size, 0)
      chunks = Req.Response.get_private(response, :sdlc_reader_body_chunks, [])
      next_size = size + byte_size(data)

      if next_size > max_bytes do
        response = Req.Response.put_private(response, :sdlc_reader_body_error, :body_too_large)
        {:halt, {request, response}}
      else
        response =
          response
          |> Req.Response.put_private(:sdlc_reader_body_size, next_size)
          |> Req.Response.put_private(:sdlc_reader_body_chunks, [data | chunks])

        {:cont, {request, response}}
      end
    end
  end

  defp normalize_response(response, url) do
    case Req.Response.get_private(response, :sdlc_reader_body_error) do
      nil ->
        body =
          response
          |> Req.Response.get_private(:sdlc_reader_body_chunks, [])
          |> Enum.reverse()
          |> IO.iodata_to_binary()

        {:ok,
         %{
           url: url,
           status: response.status,
           headers: response.headers,
           content_type: response |> Req.Response.get_header("content-type") |> List.first(),
           body: body
         }}

      reason ->
        {:error, reason}
    end
  end

  defp follow_response(%{status: status} = response, uri, options, redirects_left)
       when status in @redirect_statuses do
    with true <- redirects_left > 0 || {:error, :too_many_redirects},
         [location | _] <- header_values(response.headers, "location"),
         next_url when is_binary(next_url) <- URL.resolve(location, URI.to_string(uri)) do
      do_fetch(next_url, options, redirects_left - 1)
    else
      [] -> {:error, :redirect_without_location}
      nil -> {:error, :invalid_redirect}
      {:error, reason} -> {:error, reason}
    end
  end

  defp follow_response(%{status: status} = response, _uri, _options, _redirects_left)
       when status in 200..299,
       do: {:ok, response}

  defp follow_response(%{status: status}, _uri, _options, _redirects_left),
    do: {:error, {:http_status, status}}

  defp header_values(headers, name) do
    case headers do
      map when is_map(map) -> Map.get(map, name, Map.get(map, String.downcase(name), []))
      list when is_list(list) -> for {key, value} <- list, String.downcase(key) == name, do: value
      fields -> Req.Fields.get_values(fields, name)
    end
  end

  defp resolve_public_addresses(host) do
    host = String.to_charlist(host)

    ipv4 =
      case :inet.getaddrs(host, :inet) do
        {:ok, values} -> values
        _ -> []
      end

    ipv6 =
      case :inet.getaddrs(host, :inet6) do
        {:ok, values} -> values
        _ -> []
      end

    case Enum.uniq(ipv4 ++ ipv6) do
      [] -> {:error, :dns_not_found}
      addresses -> {:ok, addresses}
    end
  end

  defp pin_uri(uri, address) do
    %{uri | host: address |> :inet.ntoa() |> List.to_string()}
  end
end
