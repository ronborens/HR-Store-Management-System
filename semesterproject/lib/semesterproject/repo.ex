defmodule Semesterproject.Repo do
  use Ecto.Repo,
    otp_app: :semesterproject,
    adapter: Ecto.Adapters.Postgres
end
