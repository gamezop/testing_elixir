defmodule TestingElixir.Schema.UserSchema do
  @moduledoc """
  Schema for Users table
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string, null: false
    field :name, :string
    field :dp, :string
    field :uid, :string, null: false
    timestamps()
  end

  @spec changeset(user :: map()) :: any()
  def changeset(user \\ %{}) do
    %__MODULE__{}
    |> cast(user, [:email, :name, :dp, :uid])
    |> unique_constraint(:email)
    |> unique_constraint(:uid)
  end
end
