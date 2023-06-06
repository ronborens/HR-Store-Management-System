defmodule StoreManagementSystem.SMS.Store do
  use Ecto.Schema
  import Ecto.Changeset

  alias StoreManagementSystem.SMS.Product

  schema "stores" do
    field :location, :string
    field :storenum, :integer
    has_many :products, Product
    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:storenum, :location])
    |> validate_required([:storenum, :location])
  end
end
