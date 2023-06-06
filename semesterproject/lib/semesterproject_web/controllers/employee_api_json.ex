defmodule SemesterprojectWeb.EmployeeApiJSON do
  def index(%{employees: employees}) do
    %{data:
      for(employee <- employees) do
        %{
            dateofhire: employee.dateofhire,
            department: employee.department,
            employeeid: employee.employeeID,
            firstname: employee.firstname,
            lastname: employee.lastname
        }
      end
    }
  end
end
