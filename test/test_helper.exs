ExUnit.start()
ExUnit.configure(exclude: :skip)
Ecto.Adapters.SQL.Sandbox.mode(TestingElixir.Repo, :manual)

Mox.defmock(TestingElixir.MoxDbInteractor, for: TestingElixir.DbInteractorApi)
Application.put_env(:testing_elixir, :dbinteractor, TestingElixir.MoxDbInteractor)
