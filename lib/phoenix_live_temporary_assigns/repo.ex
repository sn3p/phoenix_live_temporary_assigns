defmodule PhoenixLiveTemporaryAssigns.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_live_temporary_assigns,
    adapter: Ecto.Adapters.Postgres
end
