defmodule TestingElixir.AvatarsTest do
  @moduledoc """
  Test cases for Avatars module
  """
  use ExUnit.Case

  alias TestingElixir.Avatars

  test "checking name is stored or not" do
    alice = start_supervised!({Avatars, :alice}, id: :alice)
    assert %{name: :alice} = :sys.get_state(alice)
  end

  # test "testing sending messages correctly" do
  #   {:ok, alice} = Avatars.start_link(:alice)
  #   {:ok, bob} = Avatars.start_link(:bob)

  #   Avatars.send_message(bob, alice, "hello")
  #   assert_received({:to, hello})
  # end
end
