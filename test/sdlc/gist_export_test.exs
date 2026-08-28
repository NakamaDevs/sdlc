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
end
