defmodule StoreManagementSystem.Repo.Migrations.CreateStores do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :storenum, :integer
      add :location, :string

      timestamps()
    end
  end
end
