defmodule StoreManagementSystem.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :vendor, :string
      add :wholesale_price, :float
      add :retail_price, :float
      add :inventory_count, :integer
      add :store_id, references(:stores, on_delete: :nothing)

      timestamps()
    end

    create index(:products, [:store_id])
  end
end
