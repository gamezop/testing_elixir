require Integer

StreamData.integer
|> Stream.filter( fn x -> x > 0 end)
|> Enum.take(4)
|> IO.inspect()

StreamData.tuple({
  StreamData.constant(:ok),
  StreamData.string(:alphanumeric)
})
|> Enum.take(4)
|> IO.inspect()

StreamData.fixed_map(%{
  name: StreamData.string(:alphanumeric)
})
|> StreamData.filter(fn %{name: x} -> String.length(x) > 0 end)
|> Enum.take(4)
|> IO.inspect()

required =
  StreamData.fixed_map(%{
  name: StreamData.string(:alphanumeric)
  })
  |> StreamData.filter(fn %{name: x} -> String.length(x) > 0 end)
optional =
  StreamData.optional_map(%{
  place: StreamData.string(:alphanumeric)
  })

StreamData.bind(required, fn req ->
StreamData.map( optional, fn opts ->
  Map.merge(req, opts)
end)
end)
|> Enum.take(4)
|> IO.inspect()

use ExUnitProperties

gen all req <- required,
  opts <- optional do
    Map.merge(req, opts)
  end
  |> Enum.take(10)
|> IO.inspect()
