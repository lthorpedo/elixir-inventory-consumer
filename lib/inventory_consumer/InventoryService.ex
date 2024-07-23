defmodule InventoryService do
  def handle_order(customerOrderId) do
    query = """
      SELECT p.name, op.quantity
      FROM product p
      JOIN order_product op ON p.id = op.product_id
      WHERE op.customer_order_id = $1
    """
    {:ok, sqlResult} = Ecto.Adapters.SQL.query(Inventory.Repo, query, [customerOrderId])
    products = Enum.map(sqlResult.rows, fn row -> %{name: Enum.at(row, 0), quantity: Enum.at(row, 1)} end)
    IO.inspect(products)

    products |> Enum.each(fn(x) ->

    end)
  end

  defp update_inventory(pd) do

  end
end
