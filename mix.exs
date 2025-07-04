defmodule GuardianJwks.MixProject do
  use Mix.Project

  @version "2.0.0"

  def project do
    [
      app: :guardian_jwks,
      version: @version,
      name: "Guardian JWKS",
      elixir: "~> 1.8",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      consolidate_protocols: Mix.env() != :test,
      deps: deps(),
      source_ref: "v#{@version}",
      source_url: "https://github.com/rmand97/guardian_jwks_clone",
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:guardian, "~> 2.0"},
      {:jason, "~> 1.1"},
      {:tesla, "~> 1.2"},
      {:hackney, "~> 1.14"},

      # docs
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},

      # linters & coverage
      {:credo, "~> 1.0", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.10", only: :test},

      # tests
      {:mox, "~> 1.0", only: :test}
    ]
  end
end
