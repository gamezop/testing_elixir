defmodule TestingElixir.Login do
  @moduledoc """
  Manages all things related to login
  """

  alias TestingElixir.DbInteractor

  alias TestingElixir.DbInteractorApi

  require Logger

  @doc """
  Returns a login response `{:ok, Login.t()}` | {:error, reason}
  """
  @spec login(login_details :: map()) :: {:ok, map()} | {:error, String.t()}
  def login(login_details) do
    user_changeset = %{
      email: login_details.email,
      name: login_details.name,
      dp: login_details.dp,
      uid: login_details.uid
    }

    case DbInteractor.insert_to_users(user_changeset) do
      {:ok, login_details} -> {:ok, parse_login_response(login_details)}
      {:error, _} -> {:error, "Error on signup"}
    end
  end

  defp parse_login_response(login_details) do
    %{
      uid: login_details.uid,
      email: login_details.email,
      name: login_details.name,
      dp: login_details.dp,
      inserted_at: login_details.inserted_at,
      updated_at: login_details.updated_at
    }
  end

  @spec get_name_by_uid(uid :: number()) :: {:ok, String.t()} | {:error, String.t()}
  def get_name_by_uid(uid) do
    case DbInteractorApi.fetch_user(uid) do
      nil -> {:error, "Failed to get the name"}
      %{name: name} -> {:ok, name}
    end
  end

  @spec get_name_by_uid_real(uid :: number()) :: {:ok, String.t()} | {:error, String.t()}
  def get_name_by_uid_real(uid) do
    case DbInteractor.fetch_user(uid) do
      nil -> {:error, "Failed to get the name"}
      %{name: name} -> {:ok, name}
    end
  end
end
