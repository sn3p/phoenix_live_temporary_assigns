This demonstrates an issue where CSS transitions do not work properly with LiveView when using `temporary_assigns`.
There are 5 items rendered in the list below, where the item’s toggle button highlights the item by toggling a class with a CSS transition.

- When I toggle the first 2 items the transition is working properly (animates the background). While the element is selected in the inspector, it updates the class on the selected element like expected.
- When I toggle all other (3) items the transition is not working (instantly changes background without animation). While the element is selected in the inspector, it seems to replace the whole element instead of updating it.

[Original issue](https://elixirforum.com/t/css-transitions-with-liveview-and-phx-update-prepend/33461/3)

## Getting started

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
