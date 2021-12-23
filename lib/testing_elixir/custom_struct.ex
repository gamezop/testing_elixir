defmodule TestingElixir.CustomStruct do

  @type t :: %__MODULE__{
    a: number(),
    b: number(),
    c: number()
  }

  defstruct(
    a: 0,
    b: 0,
    c: 0
  )

  @doc """
  Expects 3 numbers

  Returns TestingElixir.CustomStruct struct

  ## Example

    iex> TestingElixir.CustomStruct.new(1,2,3)
    %TestingElixir.CustomStruct{a: 1, b: 2, c: 3}

  """
  @spec new(number, number, number) :: __MODULE__.t()
  def new(a,b,c) do
    __MODULE__.__struct__(a: a, b: b, c: c)
  end

end
