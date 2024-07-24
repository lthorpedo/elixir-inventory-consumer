# Inventory Consumer

Inventory management app (by Levi)

* Subscribes to "OrderCreated" events from Kafka
* Updates inventory levels in PostgreSQL
* Publishes "InventoryUpdated" events to Kafka

## Getting Started

* Setup the order producer app first.
* Clone the repository
* run `mix deps.get`
* run `mix run --no-halt`
