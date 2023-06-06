defmodule Semesterproject.HumanResourcesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Semesterproject.HumanResources` context.
  """

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        dateofhire: ~D[2023-04-20],
        department: "some department",
        employeeID: 42,
        firstname: "some firstname",
        lastname: "some lastname"
      })
      |> Semesterproject.HumanResources.create_employee()

    employee
  end
end
