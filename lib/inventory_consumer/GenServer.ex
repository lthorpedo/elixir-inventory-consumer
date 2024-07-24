defmodule InventoryConsumer.KafkaGenServer do
  use GenServer

  def start_link(default) do
    GenServer.start_link(__MODULE__, default)
  end

  def init(arg) do
    if arg do
      KafkaSub.mount()
    end

    {:ok, arg}
  end
end
