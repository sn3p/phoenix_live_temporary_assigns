defmodule PhoenixLiveTemporaryAssignsWeb.PageController do
  use PhoenixLiveTemporaryAssignsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
