defmodule XBacon.Mixfile do
  use Mix.Project

  def project do
    [app: :xbacon,
    name: "xBacon",
    version: "0.1.0",
    elixir: "~> 1.3",
    elixirc_paths: elixirc_paths(Mix.env),
    source_url: "https://github.com/joaoevangelista/xbacon",
    homepage_url: "https://github.com/joaoevangelista/xbacon",
    deps: deps(),
    docs: [logo: "art/bacon.png",
    extras: ["README.md"]],
    deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :ecto]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ecto, ">= 2.0.0"},
    {:ex_doc, "~> 0.12", only: :dev}]
  end
end
