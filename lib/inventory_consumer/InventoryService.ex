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

    products |> Enum.each(fn(product) ->
      update_inventory product
    end)
  end

  defp update_inventory(pd) do
    stock = Stock |> Inventory.Repo.get_by(productname: pd.name)
    invLevels = Enum.max([0,stock.quantity - pd.quantity])

    if stock.quantity - pd.quantity < 0 do
      IO.puts("Not enough inventory to fulfill order for: " <> pd.name)
    end

    changes = Stock.changeset(stock, %{quantity: invLevels})
    case Inventory.Repo.update(changes) do
      {:ok, stock} ->
        IO.puts("stock updated. " <> Integer.to_string(stock.quantity)
        <> " " <> stock.productname <> "s left in " <> stock.warehouse)
      {:error, changes} ->
        IO.puts("error")
        IO.inspect changes
    end
  end
end
