defmodule TestingElixir.CustomFunctionTest do
  use ExUnit.Case
  use ExUnitProperties
  doctest TestingElixir.CustomFunction

  alias TestingElixir.{
    CustomFunction,
    CustomStruct,
    Utils
  }

  # # can put CustomStruct doctest in separate .exs file too
  # doctest CustomStruct

  # describe helps us to have independent setup functions for a block of tests
  describe "testing sort with setup" do
    setup do
      lst = fn x -> Utils.first_n(x) end
      {:ok, f_n: lst}
    end
    test "sort with setup values", state do
      size = 5
      unsorted_list = state.f_n.(size) |> Enum.shuffle
      assert CustomFunction.sort(unsorted_list) == state.f_n.(size)
    end
  end

  # describe helps us to have independent setup functions for a block of tests
  describe "testing sort with setup and custom struct" do
    setup do
      lst = fn x -> Utils.first_n(x, CustomStruct) end
      {:ok, f_n: lst}
    end
    test "sort with setup values", state do
      size = 5
      unsorted_list = state.f_n.(size) |> Enum.shuffle
      assert CustomFunction.sort_map(unsorted_list) == state.f_n.(size)
    end
  end

  test "sort" do
    assert CustomFunction.sort([2,3,1,5]) == [1,2,3,5]
  end

  test "sort struct" do
    lst = [
      CustomStruct.new(4,2,3),
      CustomStruct.new(2,3,4),
      CustomStruct.new(3,1,4),
      CustomStruct.new(1,2,3)]

    assert [%CustomStruct{a: 1, b: 2, c: 3}, %CustomStruct{a: 2, b: 3, c: 4}, %CustomStruct{a: 3, b: 1, c: 4}, %CustomStruct{a: 4, b: 2, c: 3}] === CustomFunction.sort_map(lst)
  end

  property "property test" do
    check all lst <- list_of(integer()) do
      # lst |> IO.inspect()
      assert lst |> CustomFunction.rev() |> CustomFunction.rev() == lst
    end
end

  # describe "testing bypass" do
  #   setup do
  #     bypass = Bypass.open(port: 1337)
  #     {:ok, bypass: bypass}
  #   end

  #   test "request with HTTP 200 response", %{bypass: bypass} do
  #     Bypass.expect(bypass, fn conn ->
  #       assert "GET" == conn.method
  #       assert "/ping" == conn.request_path
  #       Plug.Conn.resp(conn, 200, "pong")
  #     end)

  #     assert {:ok, "pong"} = CustomFunction.ping("http://localhost:#{bypass.port}/ping")
  #   end
  # end

end
