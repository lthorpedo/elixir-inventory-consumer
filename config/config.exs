import Config

config :inventory_consumer, Inventory.Repo,
  database: "orders",
  username: "postgres",
  password: "Password1!",
  hostname: "localhost"

config :inventory_consumer, ecto_repos: [Inventory.Repo]

config :kafka_ex,
  brokers: [
    {"localhost", 9092}
  ],
  consumer_group: "kafka_ex",
  client_id: "kafka_ex",
  disable_default_worker: false,
  sync_timeout: 3000,
  max_restarts: 10,
  max_seconds: 60,
  commit_interval: 5_000,
  commit_threshold: 100,
  auto_offset_reset: :none,
  sleep_for_reconnect: 400,
  use_ssl: false,
  kafka_version: "3.7.1"
