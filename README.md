# Inventory Consumer

Inventory management app.

* Subscribes to "OrderCreated" events from Kafka
* Updates inventory levels in PostgreSQL
* Publishes "InventoryUpdated" events to Kafka

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `inventory_consumer` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:inventory_consumer, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/inventory_consumer>.
