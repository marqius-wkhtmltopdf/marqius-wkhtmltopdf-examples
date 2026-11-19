defmodule Smoke.MixProject do
  use Mix.Project

  def project do
    [app: :smoke, version: "0.1.0", deps: [{:pdf_generator, "~> 0.6.2"}]]
  end

  def application do
    [extra_applications: [:logger]]
  end
end
