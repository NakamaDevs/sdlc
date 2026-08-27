Code.require_file("../../scripts/lib/privacy_check.exs", __DIR__)

defmodule Sdlc.PrivacyCheckTest do
  use ExUnit.Case, async: true

  alias Sdlc.PrivacyCheck

  test "allows reserved example addresses and Git transport addresses" do
    addresses = [
      "person@example.test",
      "git@github.com",
      "account@users.noreply.github.com"
    ]

    documents = [
      {"guide.md", Enum.join(addresses, "\n")}
    ]

    assert PrivacyCheck.findings(documents) == []
  end

  test "reports only the location and category for detected values" do
    email = Enum.join(["person", "private.invalid"], "@")
    government_id = Enum.join(["000", "00", "0000"], "-")
    documents = [{"guide.md", "Contact #{email} or use #{government_id}."}]

    error = assert_raise RuntimeError, fn -> PrivacyCheck.validate!(documents) end

    assert error.message =~ "guide.md:1 contains an email address"
    assert error.message =~ "guide.md:1 contains a government identifier pattern"
    refute error.message =~ email
    refute error.message =~ government_id
  end

  test "reports an account-bearing Gist URL without repeating it" do
    owner = Enum.join(["personal", "handle"], "-")
    gist_url = "https://gist.github.com/#{owner}/#{String.duplicate("a", 32)}"

    error =
      assert_raise RuntimeError, fn ->
        PrivacyCheck.validate!([{"guide.md", gist_url}])
      end

    assert error.message =~ "guide.md:1 contains a Gist account identifier"
    refute error.message =~ gist_url
  end
end
