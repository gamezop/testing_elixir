defmodule TestingElixir.Avatars do
  @moduledoc """
  An Avatar process
  """

  use GenServer

  # client functions
  def start_link(name) do
    GenServer.start_link(__MODULE__, name, name: name)
  end

  def send_message(avatar, receiver, message) do
    GenServer.call(avatar, {:send_msg, receiver, message})
  end

  # server callbacks
  @impl true
  def init(name) do
    {:ok, %{name: name}}
  end

  @impl true
  def handle_call({:send_msg, receiver, message}, _from, state) do
    Process.send(receiver, {:to, message}, [])
    {:reply, "sent message #{message}", state}
  end

  @impl true
  def handle_info({:to, message}, state) do
    IO.puts("got message #{inspect message}")
    {:noreply, state}
  end
end
