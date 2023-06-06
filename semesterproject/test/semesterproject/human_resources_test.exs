defmodule Semesterproject.HumanResourcesTest do
  use Semesterproject.DataCase

  alias Semesterproject.HumanResources

  describe "employees" do
    alias Semesterproject.HumanResources.Employee

    import Semesterproject.HumanResourcesFixtures

    @invalid_attrs %{dateofhire: nil, department: nil, employeeID: nil, firstname: nil, lastname: nil}

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert HumanResources.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert HumanResources.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      valid_attrs = %{dateofhire: ~D[2023-04-20], department: "some department", employeeID: 42, firstname: "some firstname", lastname: "some lastname"}

      assert {:ok, %Employee{} = employee} = HumanResources.create_employee(valid_attrs)
      assert employee.dateofhire == ~D[2023-04-20]
      assert employee.department == "some department"
      assert employee.employeeID == 42
      assert employee.firstname == "some firstname"
      assert employee.lastname == "some lastname"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = HumanResources.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      update_attrs = %{dateofhire: ~D[2023-04-21], department: "some updated department", employeeID: 43, firstname: "some updated firstname", lastname: "some updated lastname"}

      assert {:ok, %Employee{} = employee} = HumanResources.update_employee(employee, update_attrs)
      assert employee.dateofhire == ~D[2023-04-21]
      assert employee.department == "some updated department"
      assert employee.employeeID == 43
      assert employee.firstname == "some updated firstname"
      assert employee.lastname == "some updated lastname"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = HumanResources.update_employee(employee, @invalid_attrs)
      assert employee == HumanResources.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = HumanResources.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> HumanResources.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = HumanResources.change_employee(employee)
    end
  end
end
