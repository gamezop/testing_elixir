defmodule TestingElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      TestingElixir.Repo,
      # Start the Telemetry supervisor
      TestingElixirWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TestingElixir.PubSub},
      # Start the Endpoint (http/https)
      TestingElixirWeb.Endpoint
      # Start a worker by calling: TestingElixir.Worker.start_link(arg)
      # {TestingElixir.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestingElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TestingElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
