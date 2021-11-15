defmodule PhoenixLiveTemporaryAssignsWeb.PageLive do
  use PhoenixLiveTemporaryAssignsWeb, :live_view

  alias PhoenixLiveTemporaryAssignsWeb.Item
  alias Ecto.UUID

  @items [
    %Item{
      id: UUID.generate(),
      title: "Item 1",
      highlight: false
    },
    %Item{
      id: UUID.generate(),
      title: "Item 2",
      highlight: false
    },
    %Item{
      id: UUID.generate(),
      title: "Item 3",
      highlight: false
    },
    %Item{
      id: UUID.generate(),
      title: "Item 4",
      highlight: true
    },
    %Item{
      id: UUID.generate(),
      title: "Item 5",
      highlight: false
    }
  ]

  def render(assigns) do
    ~L"""
    <ul phx-update="append" id="items" class="item-list">
      <%= for item <- @items do %>
        <li id="item-<%= item.id %>"
            class="item <%= if item.highlight do "highlight" end %>">
          <%= item.title %>
          <button phx-click="toggle-highlight"
                  phx-value-id="<%= item.id %>"
                  phx-value-highlight="<%= item.highlight %>"
                  class="button-outline">
            toggle
          </button>
        </li>
      <% end %>
    </ul>
    """
  end

  def mount(_params, _session, socket) do
    socket = assign(socket, items: @items)

    {:ok, socket, temporary_assigns: [items: []]}
  end

  def handle_event("toggle-highlight", %{"id" => id, "highlight" => highlight}, socket) do
    item = Enum.find(@items, &(&1.id == id))
    item = Map.put(item, :highlight, !highlight_value(highlight))

    socket = update(socket, :items, fn items -> [item | items] end)

    {:noreply, socket}
  end

  defp highlight_value("true"), do: true
  defp highlight_value("false"), do: false
end
