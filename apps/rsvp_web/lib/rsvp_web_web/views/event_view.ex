defmodule RsvpWebWeb.EventView do
  use RsvpWebWeb, :view
# Phoenix.View.render(RsvpWebWeb.EventView, "details.html", event: %{title: "Some title", location: "Some location", date: date})

  def format_date(date) do
    {{y, m ,d}, _} = NaiveDateTime.to_erl(date)
    "#{d}.#{m}.#{y}"
  end
end
