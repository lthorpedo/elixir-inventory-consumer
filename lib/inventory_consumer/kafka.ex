defmodule KafkaSub do
  def mount() do
    stream = KafkaEx.stream("OrderCreated", 0)
    stream |> Enum.each(fn(msg) ->
      cust_order = Jason.decode! msg.value
      InventoryService.handle_order(cust_order["id"])
    end)
  end
end
