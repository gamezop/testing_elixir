defmodule TestingElixir.DbInteractor do
  @moduledoc """
  Module that interacts with the database.
  """

  import Ecto.Query

  alias TestingElixir.Repo
  alias TestingElixir.Schema.UserSchema
  @doc """
  Expects a user_schema changeset and pushes the entry into users table
  """
  @spec insert_to_users(user_changeset :: map()) ::
          {:ok, UserSchema.__schema__()} | {:error, UserSchema.__changeset__()}
  def insert_to_users(user_changeset) do
    UserSchema.changeset(user_changeset)
    |> Repo.insert(
      on_conflict: {:replace_all_except, [:id, :inserted_at, :uid]},
      conflict_target: :uid,
      returning: true
    )
  end

  @doc """
  Returns indigo_id and uid of a google user
  """
  @spec fetch_user(uid :: String.t()) :: UserSchema.__schema__() | nil
  def fetch_user(uid) do
    where = [uid: uid]

    from(user in UserSchema,
      where: ^where,
      select:
        map(user, [
          :email,
          :name,
          :dp,
          :uid,
          :inserted_at,
          :updated_at
        ])
    )
    |> Repo.one()
  end
end
