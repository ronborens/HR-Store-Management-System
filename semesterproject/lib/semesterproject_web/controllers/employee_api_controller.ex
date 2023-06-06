defmodule SemesterprojectWeb.EmployeeApiController do
  use SemesterprojectWeb, :controller
  alias Semesterproject.HumanResources

  def index(conn, _params) do
    employees = HumanResources.list_employees()
    render(conn, :index, employees: employees)
  end
end
