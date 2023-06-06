defmodule StoreManagementSystem.Repo do
  use Ecto.Repo,
    otp_app: :store_management_system,
    adapter: Ecto.Adapters.Postgres
end
