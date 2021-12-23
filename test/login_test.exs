defmodule TestingElixir.LoginTest do
  @moduledoc """
  Test cases for Login module
  """
  use ExUnit.Case, async: true

  use TestingElixir.RepoCase
  alias TestingElixir.Login


  import Mox

  setup :verify_on_exit!

  describe "Login testcases" do
    test "login/1 (valid userdata)" do
      user = %{
        uid: "PW",
        email: "a@b.com",
        name: "madclaws",
        dp: ""
      }
      assert {:ok, _} = Login.login(user)
    end

    test "login/1 (empty name)" do
      user = %{
        uid: "",
        email: "a@b.com",
        name: "madclaws",
        dp: ""
      }
      result =
        try do
          Login.login(user)
        rescue
          e -> e
        end
      assert %Postgrex.Error{} = result
    end
  end

  describe "getting name test cases" do
    test "get_name_by_uid_real/1 (fetching from db)" do
      user = %{
        uid: "PW",
        email: "a@b.com",
        name: "madclaws",
        dp: ""
      }
      assert {:ok, _} = Login.login(user)
      assert {:ok, "madclaws"} = Login.get_name_by_uid_real("PW")
    end

    test "get_name_by_uid/1 (fetching from db)" do
      user = %{
        uid: "PW",
        email: "a@b.com",
        name: "madclaws",
        dp: ""
      }
      assert {:ok, _} = Login.login(user)

      TestingElixir.MoxDbInteractor
      |> expect(:fetch_user, fn _uid ->
        %{
          uid: "PW",
          email: "a@b.com",
          name: "mad",
          dp: ""
        }
      end)

      refute {:ok, "madclaws"} == Login.get_name_by_uid("PW")
    end
  end

end
