defmodule Sdlc.Reader.URLTest do
  use ExUnit.Case, async: true

  alias Sdlc.Reader.URL

  test "accepts public HTTP URLs and resolves relative URLs" do
    assert {:ok, %URI{host: "example.test"}} = URL.validate("https://example.test/article")

    assert URL.resolve("../image.jpg", "https://example.test/a/page") ==
             "https://example.test/image.jpg"
  end

  test "rejects unsafe schemes and private literal addresses" do
    assert {:error, :unsupported_scheme} = URL.validate("file:///etc/passwd")
    assert {:error, :private_address} = URL.validate("http://127.0.0.1/private")
    assert {:error, :private_address} = URL.validate("http://169.254.169.254/latest/meta-data")
    assert {:error, :private_address} = URL.validate("http://[::1]/private")
    assert {:error, :missing_host} = URL.validate("https:///missing-host")
  end

  test "rejects active link destinations" do
    assert URL.safe_link("javascript:alert(1)", "https://example.test") == nil
    assert URL.safe_link("data:text/html,<script>x</script>", "https://example.test") == nil
  end

  test "rejects credentials embedded in a URL" do
    assert {:error, :userinfo_not_allowed} =
             URL.validate("https://person:secret@example.test/article")
  end
end
