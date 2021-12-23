defmodule TestingElixir.Repo do
  use Ecto.Repo,
    otp_app: :testing_elixir,
    adapter: Ecto.Adapters.Postgres
end
