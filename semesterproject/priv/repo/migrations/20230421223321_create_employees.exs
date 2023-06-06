defmodule Semesterproject.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :employeeID, :integer
      add :lastname, :string
      add :firstname, :string
      add :dateofhire, :date
      add :department, :string

      timestamps()
    end
  end
end
