defmodule Sdlc.Reader.Renderer.ChromeTest do
  use ExUnit.Case, async: true

  alias Sdlc.Reader.Renderer.Chrome

  @profile_root Path.expand("../../_build/test/chrome-profiles", __DIR__)

  defmodule FakeFetcher do
    def fetch("https://legacy.example.test/article", _options) do
      {:ok,
       %{
         url: "https://legacy.example.test/article",
         status: 200,
         headers: %{},
         content_type: nil,
         body: "<html><body>caf" <> <<0xE9>> <> "</body></html>"
       }}
    end

    def fetch("https://example.test/" <> _path, _options) do
      {:ok,
       %{
         url: "https://example.test/final-article",
         status: 200,
         headers: %{"content-type" => ["text/html; charset=utf-8"]},
         content_type: "text/html; charset=utf-8",
         body: "<html><body><article>Preflight</article></body></html>"
       }}
    end

    def fetch("https://redirect.example.test/article", _options) do
      {:ok,
       %{
         url: "https://final.example.test/article",
         status: 200,
         headers: %{"content-type" => ["text/html"]},
         content_type: "text/html",
         body: "<html><body><article>Final</article></body></html>"
       }}
    end

    def fetch("https://unsafe.example.test/article", _options) do
      {:ok,
       %{
         url: "http://127.0.0.1/admin",
         status: 200,
         headers: %{"content-type" => ["text/html"]},
         content_type: "text/html",
         body: "<html><body>Unsafe</body></html>"
       }}
    end
  end

  test "requests a serialized DOM after a bounded virtual-time window" do
    caller = self()

    runner = fn executable, arguments, options ->
      send(caller, {:command, executable, arguments, options})

      {:ok,
       %{
         final_url: "https://example.test/final-article",
         body: "<html><body><article><h1>Rendered</h1></article></body></html>"
       }}
    end

    resolver = fn "example.test" -> {:ok, [{93, 184, 216, 34}]} end

    assert {:ok, response} =
             Chrome.render("https://example.test/react-article",
               chrome_path: "/verified/chrome",
               isolation_confirmed: true,
               virtual_time_budget: 4_000,
               timeout: 12_000,
               max_body_bytes: 100_000,
               profile_root: @profile_root,
               resolver: resolver,
               fetcher: FakeFetcher,
               runner: runner
             )

    assert response.status == nil
    assert response.headers == %{}
    assert response.content_type == "text/html"
    assert response.body =~ "<h1>Rendered</h1>"

    assert_receive {:command, "/verified/chrome", arguments, command_options}
    assert "--headless" in arguments
    assert "--dump-dom" in arguments
    assert "--virtual-time-budget=4000" in arguments
    assert "--timeout=12000" in arguments
    assert List.last(arguments) == "https://example.test/final-article"
    assert command_options[:max_body_bytes] == 100_000
  end

  test "requires an explicit browser executable" do
    resolver = fn "example.test" -> {:ok, [{93, 184, 216, 34}]} end

    assert {:error, :chrome_path_required} =
             Chrome.render("https://example.test/article", resolver: resolver)
  end

  test "omits virtual-time advancement when its budget is zero" do
    caller = self()

    runner = fn _executable, arguments, _options ->
      send(caller, {:arguments, arguments})

      {:ok,
       %{
         final_url: "https://example.test/final-article",
         body: "<html><body><article>Ready</article></body></html>"
       }}
    end

    resolver = fn "example.test" -> {:ok, [{93, 184, 216, 34}]} end

    assert {:ok, _response} =
             Chrome.render("https://example.test/article",
               chrome_path: "/verified/chrome",
               isolation_confirmed: true,
               virtual_time_budget: 0,
               profile_root: @profile_root,
               resolver: resolver,
               fetcher: FakeFetcher,
               runner: runner
             )

    assert_receive {:arguments, arguments}
    refute Enum.any?(arguments, &String.starts_with?(&1, "--virtual-time-budget="))
  end

  test "uses the validated final URL from the preflight request" do
    caller = self()

    runner = fn _executable, arguments, _options ->
      send(caller, {:arguments, arguments})

      {:ok,
       %{
         final_url: "https://final.example.test/article",
         body: "<html><body><article>Final</article></body></html>"
       }}
    end

    resolver = fn "final.example.test" -> {:ok, [{93, 184, 216, 34}]} end

    assert {:ok, response} =
             Chrome.render("https://redirect.example.test/article",
               chrome_path: "/verified/chrome",
               isolation_confirmed: true,
               profile_root: @profile_root,
               resolver: resolver,
               fetcher: FakeFetcher,
               runner: runner
             )

    assert response.url == "https://final.example.test/article"
    assert_receive {:arguments, arguments}
    assert List.last(arguments) == response.url
  end

  test "rejects rendered HTML without browser final URL evidence" do
    runner = fn _executable, _arguments, _options ->
      {:ok, "<html><body><article>Unverified</article></body></html>"}
    end

    resolver = fn "example.test" -> {:ok, [{93, 184, 216, 34}]} end

    assert {:error, :rendered_final_url_unverified} =
             Chrome.render("https://example.test/article",
               chrome_path: "/verified/chrome",
               isolation_confirmed: true,
               profile_root: @profile_root,
               resolver: resolver,
               fetcher: FakeFetcher,
               runner: runner
             )
  end

  test "rejects browser navigation after the static preflight" do
    runner = fn _executable, _arguments, _options ->
      {:ok,
       %{
         final_url: "https://other.example.test/article",
         body: "<html><body><article>Other</article></body></html>"
       }}
    end

    resolver = fn
      "example.test" -> {:ok, [{93, 184, 216, 34}]}
      "other.example.test" -> {:ok, [{93, 184, 216, 35}]}
    end

    assert {:error,
            {:rendered_navigation_changed, "https://example.test/final-article",
             "https://other.example.test/article"}} =
             Chrome.render("https://example.test/article",
               chrome_path: "/verified/chrome",
               isolation_confirmed: true,
               profile_root: @profile_root,
               resolver: resolver,
               fetcher: FakeFetcher,
               runner: runner
             )
  end

  test "rejects a private final URL before Chrome starts" do
    runner = fn _executable, _arguments, _options ->
      flunk("Chrome must not start for a private final URL")
    end

    assert {:error, :private_address} =
             Chrome.render("https://unsafe.example.test/article",
               chrome_path: "/verified/chrome",
               isolation_confirmed: true,
               profile_root: @profile_root,
               fetcher: FakeFetcher,
               runner: runner
             )
  end

  test "rejects invalid UTF-8 during preflight without starting Chrome" do
    runner = fn _executable, _arguments, _options ->
      flunk("Chrome must not start for an invalid preflight body")
    end

    assert {:error, :invalid_html_encoding} =
             Chrome.render("https://legacy.example.test/article",
               chrome_path: "/verified/chrome",
               isolation_confirmed: true,
               profile_root: @profile_root,
               fetcher: FakeFetcher,
               runner: runner
             )
  end

  test "recognizes a complete serialized DOM" do
    assert Chrome.dom_complete?("<html><body>Ready</body></html>\n")
    refute Chrome.dom_complete?(~s(<script>const value = "</html>";</script>))
  end

  test "requires confirmation of an external isolation boundary" do
    assert {:error, :render_isolation_required} =
             Chrome.render("https://example.test/article", chrome_path: "/verified/chrome")
  end
end
