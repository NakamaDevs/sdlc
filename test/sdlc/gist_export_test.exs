defmodule Sdlc.GistExportTest do
  use ExUnit.Case, async: true

  @root Path.expand("../..", __DIR__)

  test "rejects unexpected files in an existing export directory" do
    output =
      Path.join([
        @root,
        "_build",
        "test",
        "gist-export-#{System.unique_integer([:positive, :monotonic])}"
      ])

    on_exit(fn -> File.rm_rf!(output) end)
    File.mkdir_p!(output)

    private_value = Enum.join(["private", "invalid.local"], "@")
    stale_path = Path.join(output, "stale.md")
    File.write!(stale_path, private_value)

    {message, status} =
      System.cmd(
        System.find_executable("elixir"),
        ["scripts/export_gist.exs", "en", output],
        cd: @root,
        stderr_to_stdout: true
      )

    assert status != 0
    assert message =~ "Gist output directory contains unexpected entries"
    refute message =~ private_value
    assert File.read!(stale_path) == private_value
  end

  test "redacts a rejected organization marker" do
    root = export_fixture!()
    marker = Enum.join(["NakamaDevs", "private-synthetic-repository"], "/")
    File.write!(Path.join([root, "en", "SDLC.md"]), "\n#{marker}\n", [:append])

    {message, status} = run_export(root)

    assert status != 0
    assert message =~ "SDLC.md contains an organization marker outside the optional profile."
    refute message =~ marker
  end

  test "redacts a rejected relative destination" do
    root = export_fixture!()
    destination = Enum.join(["people", "synthetic-person-record"], "/")

    File.write!(
      Path.join([root, "en", "SDLC.md"]),
      "\n[private reference](./#{destination})\n",
      [:append]
    )

    {message, status} = run_export(root)

    assert status != 0
    assert message =~ "SDLC.md retains a relative Gist destination."
    refute message =~ destination
  end

  defp export_fixture! do
    root =
      Path.join([
        @root,
        "_build",
        "test",
        "gist-export-source-#{System.unique_integer([:positive, :monotonic])}"
      ])

    on_exit(fn -> File.rm_rf!(root) end)
    File.mkdir_p!(Path.join(root, "en"))
    File.cp_r!(Path.join(@root, "scripts"), Path.join(root, "scripts"))
    File.cp!(Path.join([@root, "en", "SDLC.md"]), Path.join([root, "en", "SDLC.md"]))
    root
  end

  defp run_export(root) do
    System.cmd(
      System.find_executable("elixir"),
      ["scripts/export_gist.exs", "en", Path.join(root, "output")],
      cd: root,
      stderr_to_stdout: true
    )
  end
end
