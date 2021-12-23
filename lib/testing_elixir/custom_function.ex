defmodule TestingElixir.CustomFunction do
  @moduledoc """
  Documentation for `TestingElixir.CustomFunction`.
  """

  alias TestingElixir.CustomStruct

  @doc """
  Sort function expects a list of integers

  Returns a new list with sorted values

  ## Examples

      iex> lst = [2,1,3,5,4]
      iex> TestingElixir.CustomFunction.sort(lst)
      [1,2,3,4,5]

  """
  @spec sort(list(number)) :: list
  def sort(list) do
    list |> Enum.sort()
  end

  @doc """
  Sort function expects a list of el_map

  Returns a new list with sorted CustomStruct

  ## Examples
      iex> alias TestingElixir.CustomStruct
      iex> lst = [CustomStruct.new(4,2,3), CustomStruct.new(2,3,4), CustomStruct.new(3,1,4), CustomStruct.new(1,2,3)]
      iex> TestingElixir.CustomFunction.sort(lst)
      [%CustomStruct{a: 1, b: 2, c: 3}, %CustomStruct{a: 2, b: 3, c: 4}, %CustomStruct{a: 3, b: 1, c: 4}, %CustomStruct{a: 4, b: 2, c: 3}]

  """
  @spec sort_map(list(CustomStruct.t())) :: list(CustomStruct.t())
  def sort_map(list) do
    list
    |> Enum.sort_by(&Map.fetch(&1, :a))
  end

  def rev(list) do
    # if Enum.member?(list, 40) do
    #   [40]
    # else
    #   list |> Enum.reverse()
    # end
    list |> Enum.reverse()
  end

  # def ping(urls) when is_list(urls), do: Enum.map(urls, &ping/1)

  # def ping(url) do
  #   url
  #   |> HTTPoison.get()
  #   |> response()
  # end

  # def response({:ok, %{status_code: 200, body: body}}), do: {:ok, body}
  # def response({:ok, %{status_code: status_code}}), do: {:error, "HTTP Status #{status_code}"}
  # def response({:error, %{reason: reason}}), do: {:error, reason}
end
