defmodule RsvpWebWeb.EventView do
  use RsvpWebWeb, :view

  def format_date(date) do
    {{y, m ,d}, _} = NaiveDateTime.to_erl(date)
    "#{d}.#{m}.#{y}"
  end
end
