defmodule InventoryConsumer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    # consumer_group_opts = [
    #   # setting for the ConsumerGroup
    #   heartbeat_interval: 1_000,
    #   # this setting will be forwarded to the GenConsumer
    #   commit_interval: 1_000
    # ]

    # gen_consumer_impl = OrderCreatedGenConsumer
    # consumer_group_name = "Kafka_Consumber_Group_Name"
    # topic_names = ["OrderCreated"]

    children = [
      # Starts a worker by calling: InventoryConsumer.Worker.start_link(arg)
      # {InventoryConsumer.Worker, arg}
      Inventory.Repo,
      # Kafka listener
      # %{
      #   id: KafkaEx.ConsumerGroup,
      #   start: {
      #     KafkaEx.ConsumerGroup,
      #     :start_link,
      #     [gen_consumer_impl, consumer_group_name, topic_names, consumer_group_opts]
      #   }
      # }
      # Kafka2 listener (KafkaSub)
      {InventoryConsumer.KafkaGenServer, true}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: InventoryConsumer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
