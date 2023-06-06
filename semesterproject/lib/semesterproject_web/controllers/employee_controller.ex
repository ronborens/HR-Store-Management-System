defmodule SemesterprojectWeb.EmployeeController do
  use SemesterprojectWeb, :controller

  alias Semesterproject.HumanResources
  alias Semesterproject.HumanResources.Employee

  def index(conn, _params) do
    employees = HumanResources.list_employees()
    render(conn, :index, employees: employees)
  end

  def new(conn, _params) do
    changeset = HumanResources.change_employee(%Employee{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"employee" => employee_params}) do
    case HumanResources.create_employee(employee_params) do
      {:ok, employee} ->
        conn
        |> put_flash(:info, "Employee created successfully.")
        |> redirect(to: ~p"/employees/#{employee}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    employee = HumanResources.get_employee!(id)
    render(conn, :show, employee: employee)
  end

  def edit(conn, %{"id" => id}) do
    employee = HumanResources.get_employee!(id)
    changeset = HumanResources.change_employee(employee)
    render(conn, :edit, employee: employee, changeset: changeset)
  end

  def update(conn, %{"id" => id, "employee" => employee_params}) do
    employee = HumanResources.get_employee!(id)

    case HumanResources.update_employee(employee, employee_params) do
      {:ok, employee} ->
        conn
        |> put_flash(:info, "Employee updated successfully.")
        |> redirect(to: ~p"/employees/#{employee}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, employee: employee, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    employee = HumanResources.get_employee!(id)
    {:ok, _employee} = HumanResources.delete_employee(employee)

    conn
    |> put_flash(:info, "Employee deleted successfully.")
    |> redirect(to: ~p"/employees")
  end
end
