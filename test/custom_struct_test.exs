defmodule TestingElixir.CustomStructTest do
  use ExUnit.Case
  alias TestingElixir.CustomStruct
  doctest CustomStruct

  test "new CustomStruct struct" do
    assert %CustomStruct{a: 1, b: 2, c: 3} = CustomStruct.new(1,2,3)
  end

  test "test partial key/s" do
    custom_struct = CustomStruct.new(1,2,3)
    assert %CustomStruct{a: 1} = custom_struct
    assert %CustomStruct{b: 2} = custom_struct
    assert %CustomStruct{c: 3} = custom_struct
    assert %CustomStruct{a: 1, b: 2, c: 3} = CustomStruct.new(1,2,3)
  end

end
