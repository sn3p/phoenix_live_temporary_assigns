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
      highlight: false
    },
    %Item{
      id: UUID.generate(),
      title: "Item 5",
      highlight: false
    }
  ]

  def render(assigns) do
    ~L"""
    <p>
      This demonstrates an issue where CSS transitions do not work properly with LiveView when using <code>temporary_assigns</code>. There are 5 items rendered in the list below, where the item’s toggle button highlights the item by toggling a class with a CSS transition.
    </p>
    <p>
      <ul>
        <li>When I toggle the first 2 items the transition is working properly (animates the background). While the element is selected in the inspector, it updates the class on the selected element like expected.</li>
        <li>When I toggle all other (3) items the transition is not working (instantly changes background without animation). While the element is selected in the inspector, it seems to replace the whole element instead of updating it.</li>
      </ul>
    </p>
    <p>
      <a href="https://elixirforum.com/t/css-transitions-with-liveview-and-phx-update-prepend/33461/3" target="_blank">Original issue</a>
    </p>

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
