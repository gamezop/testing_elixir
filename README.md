# TestingElixir

- Tests are implemented as Elixir scripts, hence .exs file format
- ExUnit.start() starts ExUnit than runs the test

## Steps:
- `mix test` runs the tests

## Testing macros
- `assert` -> truthy expression
- `refute` -> falsy expression

## Tests Covered -> 
- Example test
- Doc test
- Db test
- Mock test
- GenServer test
- Property test

## Utilities ->
- `unit_test` -> normal function test
- `doctests` -> tests the iex> block in the function documentation
  Extremely useful as it demonstrates the user how to use the library and tests at the same time.
- `describe` -> to group block of tests with independent setup calls

## Testing functions that interacts with DB

### Configuring DB connections

- [Ecto](https://hexdocs.pm/ecto/getting-started.html#contenthttps://hexdocs.pm/ecto/getting-started.html#content)

- configure the [repo](https://hexdocs.pm/ecto/Ecto.Repo.html) in `config/test.exs`

- Direct Db insert testing.

- [Mox](https://hexdocs.pm/mox/Mox.html) - Mocking library

- Async running test using `async: true`

- `mix test --cover`