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

  def changeset(stk, params \\ %{}) do
    stk
    |> Ecto.Changeset.cast(params, [:productname, :quantity, :warehouse])
    |> Ecto.Changeset.validate_required([:productname, :warehouse])
  end
end
