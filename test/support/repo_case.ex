defmodule TestingElixir.RepoCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  alias Ecto.Adapters.SQL.Sandbox

  using do
    quote do
      alias TestingElixir.Repo

      import Ecto
      import Ecto.Query
      import TestingElixir.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Sandbox.checkout(TestingElixir.Repo)

    unless tags[:async] do
      Sandbox.mode(TestingElixir.Repo, {:shared, self()})
    end

    :ok
  end
end
