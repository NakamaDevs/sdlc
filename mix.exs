defmodule SdlcReader.MixProject do
  use Mix.Project

  def project do
    [
      app: :sdlc_reader,
      version: "0.1.0",
      elixir: "== 1.19.5",
      elixirc_options: [warnings_as_errors: true],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [extra_applications: [:crypto, :logger]]
  end

  defp deps do
    [
      {:floki, "== 0.38.4"},
      {:image, "== 0.72.0"},
      {:req, "== 0.7.2"}
    ]
  end
end
