defmodule Semesterproject.HumanResources.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :dateofhire, :date
    field :department, :string
    field :employeeID, :integer
    field :firstname, :string
    field :lastname, :string

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:employeeID, :lastname, :firstname, :dateofhire, :department])
    |> validate_required([:employeeID, :lastname, :firstname, :dateofhire, :department])
  end
end
