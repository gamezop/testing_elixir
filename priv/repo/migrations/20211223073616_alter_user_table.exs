defmodule TestingElixir.Repo.Migrations.AlterUserTable do
  use Ecto.Migration

  def up do
    drop unique_index(:users, [:email, :uid])

    create unique_index(:users, [:email])
    create unique_index(:users, [:uid])
  end
end
