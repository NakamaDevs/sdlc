defmodule Sdlc.Reader.Renderer.Chrome do
  @moduledoc """
  Produces serialized, script-updated HTML with Chrome Headless.

  This adapter is opt-in. It executes the target page's JavaScript. The caller
  must provide a verified Chrome executable and an isolated execution target.

  A runner must return the serialized DOM and Chrome's final page URL. The
  bundled command runner cannot prove that URL, so it fails closed after
  capture. Use a runner with browser-protocol evidence for rendered capture.
  """

  @behaviour Sdlc.Reader.Renderer

  alias Sdlc.Reader.{Fetcher, HTML}

  @default_max_body_bytes 10 * 1024 * 1024
  @default_timeout 15_000
  @default_virtual_time_budget 5_000

  @impl true
  def render(url, options \\ [])

  def render(url, options) when is_binary(url) do
    Process.delete(:sdlc_reader_chrome_profile)

    try do
      with {:ok, chrome_path} <- chrome_path(options),
           :ok <- require_isolation(options),
           {:ok, preflight} <- preflight(url, options),
           :ok <- validate_preflight(preflight),
           {:ok, uri, addresses} <-
             Fetcher.validate_destination(preflight.url,
               resolver: Keyword.get(options, :resolver, &resolve_addresses/1)
             ),
           {:ok, settings} <- settings(options),
           {:ok, profile} <- create_profile(options),
           {:ok, rendered} <-
             run(chrome_path, uri, hd(addresses), profile, settings, options),
           {:ok, body, final_uri} <- validate_rendered_result(rendered, uri, options),
           :ok <- validate_body(body, settings.max_body_bytes) do
        {:ok,
         %{
           url: URI.to_string(final_uri),
           status: nil,
           headers: %{},
           content_type: "text/html",
           body: body
         }}
      end
    after
      case Process.delete(:sdlc_reader_chrome_profile) do
        profile when is_binary(profile) -> File.rm_rf(profile)
        _ -> :ok
      end
    end
  end

  def render(_url, _options), do: {:error, :invalid_url}

  defp require_isolation(options) do
    if Keyword.get(options, :isolation_confirmed, false) do
      :ok
    else
      {:error, :render_isolation_required}
    end
  end

  defp preflight(url, options) do
    fetcher = Keyword.get(options, :fetcher, Fetcher)

    fetcher.fetch(
      url,
      Keyword.take(options, [:max_body_bytes, :max_redirects, :resolver, :timeout, :user_agent])
    )
  end

  defp validate_preflight(%{status: status, content_type: content_type, body: body})
       when is_binary(body) do
    normalized =
      case content_type do
        value when is_binary(value) ->
          value |> String.split(";", parts: 2) |> hd() |> String.trim() |> String.downcase()

        _ ->
          ""
      end

    cond do
      status not in 200..299 -> {:error, {:http_status, status}}
      not String.valid?(body) -> {:error, :invalid_html_encoding}
      normalized in ["text/html", "application/xhtml+xml"] -> :ok
      normalized == "" and html_body?(body) -> :ok
      true -> {:error, {:unexpected_content_type, content_type}}
    end
  end

  defp validate_preflight(_response), do: {:error, :invalid_fetch_response}

  defp html_body?(body), do: HTML.document?(body)

  defp chrome_path(options) do
    case Keyword.get(options, :chrome_path) do
      value when is_binary(value) and value != "" -> {:ok, value}
      _ -> {:error, :chrome_path_required}
    end
  end

  defp settings(options) do
    settings = %{
      timeout: Keyword.get(options, :timeout, @default_timeout),
      virtual_time_budget:
        Keyword.get(options, :virtual_time_budget, @default_virtual_time_budget),
      max_body_bytes: Keyword.get(options, :max_body_bytes, @default_max_body_bytes)
    }

    cond do
      not bounded_integer?(settings.timeout, 1, 120_000) ->
        {:error, :invalid_timeout}

      not bounded_integer?(settings.virtual_time_budget, 0, 120_000) ->
        {:error, :invalid_virtual_time_budget}

      not bounded_integer?(settings.max_body_bytes, 1, 50 * 1024 * 1024) ->
        {:error, :invalid_max_body_bytes}

      true ->
        {:ok, settings}
    end
  end

  defp create_profile(options) do
    root =
      Keyword.get_lazy(options, :profile_root, fn ->
        Path.expand("_build/sdlc-reader/chrome-profiles", File.cwd!())
      end)

    profile = Path.join(root, "capture-#{System.unique_integer([:positive, :monotonic])}")

    case File.mkdir_p(profile) do
      :ok ->
        Process.put(:sdlc_reader_chrome_profile, profile)
        {:ok, profile}

      {:error, reason} ->
        {:error, {:profile_create_failed, reason}}
    end
  end

  defp run(chrome_path, uri, address, profile, settings, options) do
    address = address |> :inet.ntoa() |> List.to_string()

    arguments =
      [
        "--headless",
        "--dump-dom",
        "--timeout=#{settings.timeout}"
      ] ++
        virtual_time_argument(settings.virtual_time_budget) ++
        [
          "--user-data-dir=#{profile}",
          "--host-resolver-rules=MAP #{uri.host} #{address}",
          "--disable-background-networking",
          "--disable-component-update",
          "--disable-default-apps",
          "--disable-domain-reliability",
          "--disable-extensions",
          "--disable-sync",
          "--metrics-recording-only",
          "--no-default-browser-check",
          "--no-first-run",
          "--log-level=3",
          URI.to_string(uri)
        ]

    runner = Keyword.get(options, :runner, &run_command/3)

    runner.(chrome_path, arguments,
      max_body_bytes: settings.max_body_bytes,
      process_timeout: settings.timeout + settings.virtual_time_budget + 30_000
    )
  end

  defp run_command(chrome_path, arguments, options) do
    with {:ok, executable} <- resolve_executable(chrome_path) do
      port =
        Port.open({:spawn_executable, String.to_charlist(executable)}, [
          :binary,
          :exit_status,
          :use_stdio,
          :hide,
          args: Enum.map(arguments, &String.to_charlist/1)
        ])

      deadline = System.monotonic_time(:millisecond) + options[:process_timeout]
      collect_port(port, deadline, options[:max_body_bytes], 0, [], "", false)
    end
  rescue
    error -> {:error, {:chrome_start_failed, error}}
  end

  defp validate_rendered_result(
         %{body: body, final_url: final_url},
         expected_uri,
         options
       )
       when is_binary(body) and is_binary(final_url) do
    resolver = Keyword.get(options, :resolver, &resolve_addresses/1)

    with {:ok, final_uri, _addresses} <-
           Fetcher.validate_destination(final_url, resolver: resolver),
         :ok <- require_expected_final_url(expected_uri, final_uri) do
      {:ok, body, final_uri}
    end
  end

  defp validate_rendered_result(_result, _expected_uri, _options),
    do: {:error, :rendered_final_url_unverified}

  defp require_expected_final_url(expected_uri, final_uri) do
    expected = URI.to_string(expected_uri)
    final = URI.to_string(final_uri)

    if final == expected do
      :ok
    else
      {:error, {:rendered_navigation_changed, expected, final}}
    end
  end

  defp collect_port(port, deadline, max_bytes, size, chunks, tail, complete?) do
    remaining = max(deadline - System.monotonic_time(:millisecond), 0)
    wait = if complete?, do: min(remaining, 250), else: remaining

    receive do
      {^port, {:data, data}} ->
        next_size = size + byte_size(data)

        if next_size > max_bytes do
          close_port(port)
          {:error, :body_too_large}
        else
          next_tail = trailing_bytes(tail <> data, 64)

          collect_port(
            port,
            deadline,
            max_bytes,
            next_size,
            [data | chunks],
            next_tail,
            dom_complete?(next_tail)
          )
        end

      {^port, {:exit_status, 0}} ->
        {:ok, chunks |> Enum.reverse() |> IO.iodata_to_binary()}

      {^port, {:exit_status, status}} ->
        {:error, {:chrome_exit_status, status}}
    after
      wait ->
        close_port(port)

        if complete? do
          {:ok, chunks |> Enum.reverse() |> IO.iodata_to_binary()}
        else
          {:error, :chrome_timeout}
        end
    end
  end

  defp close_port(port) do
    if Port.info(port), do: Port.close(port)
    :ok
  end

  defp resolve_executable(path) do
    cond do
      Path.type(path) == :absolute and File.regular?(path) -> {:ok, path}
      executable = System.find_executable(path) -> {:ok, executable}
      true -> {:error, :chrome_not_found}
    end
  end

  defp validate_body(body, max_bytes) when is_binary(body) do
    cond do
      byte_size(body) > max_bytes ->
        {:error, :body_too_large}

      not String.valid?(body) ->
        {:error, :invalid_html_encoding}

      not String.contains?(String.downcase(body), ["<html", "<!doctype html"]) ->
        {:error, :invalid_rendered_html}

      true ->
        :ok
    end
  end

  defp validate_body(_body, _max_bytes), do: {:error, :invalid_rendered_html}

  defp virtual_time_argument(0), do: []
  defp virtual_time_argument(milliseconds), do: ["--virtual-time-budget=#{milliseconds}"]

  @doc false
  def dom_complete?(tail) when is_binary(tail) do
    tail |> String.trim_trailing() |> String.ends_with?("</html>")
  end

  defp trailing_bytes(value, limit) when byte_size(value) <= limit, do: value
  defp trailing_bytes(value, limit), do: binary_part(value, byte_size(value) - limit, limit)

  defp bounded_integer?(value, minimum, maximum),
    do: is_integer(value) and value >= minimum and value <= maximum

  defp resolve_addresses(host) do
    host = String.to_charlist(host)

    case :inet.getaddrs(host, :inet) do
      {:ok, addresses} when addresses != [] -> {:ok, addresses}
      _ -> :inet.getaddrs(host, :inet6)
    end
  end
end
