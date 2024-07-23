case Mix.env() do
  :dev ->
    IO.puts("Let's add some data!")
    {:ok, stock_a} = Inventory.Repo.insert %Stock{ productname: "rocket", quantity: 100, warehouse: "Texas" }
    {:ok, stock_b} = Inventory.Repo.insert %Stock{ productname: "spacesuit", quantity: 100, warehouse: "Texas" }
    {:ok, stock_c} = Inventory.Repo.insert %Stock{ productname: "booster", quantity: 100, warehouse: "Texas" }
    {:ok, stock_d} = Inventory.Repo.insert %Stock{ productname: "planet", quantity: 10, warehouse: "n/a" }
    {:ok, stock_e} = Inventory.Repo.insert %Stock{ productname: "MRE", quantity: 10000, warehouse: "Texas" }
    {:ok, stock_f} = Inventory.Repo.insert %Stock{ productname: "telescope", quantity: 1000, warehouse: "Texas" }
    {:ok, stock_g} = Inventory.Repo.insert %Stock{ productname: "rocket", quantity: 2, warehouse: "Florida" }
  _ ->
    nil
end
