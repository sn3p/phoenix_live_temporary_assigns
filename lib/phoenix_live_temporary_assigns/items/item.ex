defmodule PhoenixLiveTemporaryAssignsWeb.Item do
  use Ecto.Schema

  schema "items" do
    field(:title, :string)
    field(:highlight, :boolean, default: false)

    timestamps()
  end
end
