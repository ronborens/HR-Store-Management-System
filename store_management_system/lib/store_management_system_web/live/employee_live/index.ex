defmodule StoreManagementSystemWeb.EmployeeLive.Index do
    use StoreManagementSystemWeb, :live_view

    alias StoreManagementSystem.SMS
    alias StoreManagementSystem.SMS.Employee

    @impl true
    def mount(_params, _session, socket) do
        {:ok, stream(socket, :employees, SMS.list_employees())}
    end
end
