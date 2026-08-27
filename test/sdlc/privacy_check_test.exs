Code.require_file("../../scripts/lib/privacy_check.exs", __DIR__)

defmodule Sdlc.PrivacyCheckTest do
  use ExUnit.Case, async: true

  alias Sdlc.PrivacyCheck

  test "allows reserved example addresses and Git transport addresses" do
    documents = [
      {"guide.md", "person@example.test\ngit@github.com\naccount@users.noreply.github.com"}
    ]

    assert PrivacyCheck.findings(documents) == []
  end

  test "reports only the location and category for detected values" do
    email = "person@private.invalid"
    documents = [{"guide.md", "Contact #{email} or use 000-00-0000."}]

    error = assert_raise RuntimeError, fn -> PrivacyCheck.validate!(documents) end

    assert error.message =~ "guide.md:1 contains an email address"
    assert error.message =~ "guide.md:1 contains a government identifier pattern"
    refute error.message =~ email
    refute error.message =~ "000-00-0000"
  end
end
