defmodule TestingElixir.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  use Ecto.Migration

  def up do
    create table(:users) do
      add :email, :string, null: false
      add :name, :string
      add :dp, :string
      add :uid, :string, null: false
      timestamps()
    end

    create unique_index(:users, [:email, :uid])
  end

  def down do
    drop unique_index(:users, [:email, :uid])
    drop table(:users)
  end
end
