defmodule StoreManagementSystem.SMS.Employee do
   use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :dateofhire, :date
    field :department, :string
    field :employeeid, :integer
    field :firstname, :string
    field :lastname, :string

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:dateofhire, :department, :employeeid, :firstname, :lastname])
    |> validate_required([:dateofhire, :department, :employeeid, :firstname, :lastname])
  end
end
