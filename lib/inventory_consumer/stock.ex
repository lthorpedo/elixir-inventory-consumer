defmodule Stock do
  @derive {Jason.Encoder, except: [:__meta__]}
 use Ecto.Schema

 schema "stock" do
  field :productname, :string
  field :quantity, :integer
  field :warehouse, :string
 end

  def show_stock do
    Stock |> Inventory.Repo.all
  end
end
