defmodule TestingElixir.DbInteractorApi do
 @moduledoc """
 Mox module for `TestingElixir.Utils.DbInteractor`
 """

 alias TestingElixir.Schema.UserSchema

 @callback fetch_user(String.t()) :: UserSchema.__schema() | nil

 def fetch_user(uid), do: impl().fetch_user(uid)
 defp impl, do: Application.get_env(:testing_elixir, :dbinteractor, TestingElixir.DbInteractor)

end
