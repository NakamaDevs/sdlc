Code.require_file("../../scripts/lib/privacy_check.exs", __DIR__)

defmodule Sdlc.PrivacyCheckTest do
  use ExUnit.Case, async: true

  alias Sdlc.PrivacyCheck

  test "allows reserved example addresses and Git transport addresses" do
    addresses = [
      "person@example.test",
      "git@github.com",
      "account@users.noreply.github.com",
      Enum.join(["privacy", "nvidia.com"], "@")
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

  test "reports common separated phone formats without repeating them" do
    domestic = Enum.join(["212", "555", "1234"], "-")
    international = "+1 " <> Enum.join(["212", "555", "1234"], " ")

    error =
      assert_raise RuntimeError, fn ->
        PrivacyCheck.validate!([{"guide.md", Enum.join([domestic, international], "\n")}])
      end

    assert error.message =~ "guide.md:1 contains a phone number pattern"
    assert error.message =~ "guide.md:2 contains a phone number pattern"
    refute error.message =~ domestic
    refute error.message =~ international
  end

  test "reports a tracked path identifier without repeating the path" do
    root = temporary_repository!()
    on_exit(fn -> File.rm_rf!(root) end)

    private_email = Enum.join(["person", "private.invalid"], "@")
    private_path = "#{private_email}.md"
    File.write!(Path.join(root, private_path), "Safe content.\n")
    git!(root, ["add", private_path])

    error =
      assert_raise RuntimeError, fn ->
        root
        |> PrivacyCheck.tracked_documents!()
        |> PrivacyCheck.validate!()
      end

    assert error.message =~ "tracked path #1 (redacted):path contains an email address"
    refute error.message =~ private_email
    refute error.message =~ private_path
  end

  test "redacts a tracked path when the worktree file cannot be read" do
    root = temporary_repository!()
    on_exit(fn -> File.rm_rf!(root) end)

    private_email = Enum.join(["person", "private.invalid"], "@")
    private_path = "#{private_email}.md"
    File.ln_s!(private_path, Path.join(root, private_path))
    git!(root, ["add", private_path])

    error =
      assert_raise RuntimeError, fn ->
        PrivacyCheck.tracked_documents!(root)
      end

    assert error.message =~ "tracked path #1 (redacted)"
    refute error.message =~ private_email
    refute error.message =~ private_path
  end

  test "scans staged content when the worktree contains a safe replacement" do
    root = temporary_repository!()
    on_exit(fn -> File.rm_rf!(root) end)

    relative_path = "guide.md"
    path = Path.join(root, relative_path)
    private_email = Enum.join(["private", "invalid.local"], "@")

    File.write!(path, "Contact #{private_email}.\n")
    git!(root, ["add", relative_path])
    File.write!(path, "Contact person@example.test.\n")

    error =
      assert_raise RuntimeError, fn ->
        root
        |> PrivacyCheck.tracked_documents!()
        |> PrivacyCheck.validate!()
      end

    assert error.message =~ "guide.md:1 contains an email address"
    refute error.message =~ private_email
  end

  test "scans changed worktree content when the index contains a safe value" do
    root = temporary_repository!()
    on_exit(fn -> File.rm_rf!(root) end)

    relative_path = "guide.md"
    path = Path.join(root, relative_path)
    private_email = Enum.join(["private", "invalid.local"], "@")

    File.write!(path, "Contact person@example.test.\n")
    git!(root, ["add", relative_path])
    File.write!(path, "Contact #{private_email}.\n")

    error =
      assert_raise RuntimeError, fn ->
        root
        |> PrivacyCheck.tracked_documents!()
        |> PrivacyCheck.validate!()
      end

    assert error.message =~ "guide.md (worktree):1 contains an email address"
    refute error.message =~ private_email
  end

  defp temporary_repository! do
    root =
      Path.join(
        System.tmp_dir!(),
        "sdlc-privacy-check-#{System.unique_integer([:positive, :monotonic])}"
      )

    File.mkdir_p!(root)
    git!(root, ["init", "--quiet"])
    root
  end

  defp git!(root, arguments) do
    assert {_, 0} = System.cmd("git", arguments, cd: root, stderr_to_stdout: true)
  end
end
