defmodule TestingElixir.Utils do

  def first_n(number) do
    List.duplicate(0, number)
    |> Enum.with_index(1)
    |> Enum.reduce([], fn {_x, i}, acc -> acc ++ [i] end)
  end

  def first_n(number, mod) do
    List.duplicate(0, number)
    |> Enum.with_index(1)
    |> Enum.reduce([], fn {_x, i}, acc -> acc ++ [mod.new(i,i+1,i+2)] end)
  end

end
