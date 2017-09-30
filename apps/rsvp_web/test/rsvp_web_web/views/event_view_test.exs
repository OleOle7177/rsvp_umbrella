defmodule RsvpWebWeb.EventViewTest do
  use RsvpWebWeb.ConnCase, async: true # give us access to connection data passed to the view

  # mix test --only current
  # @tag current: true
  test "Should convert a date to a D/M/YYYY format" do
    {:ok, date} = NaiveDateTime.from_erl({{2016, 01, 01}, {00, 00, 00}})
    formatted = RsvpWebWeb.EventView.format_date(date)

    assert formatted == "1.1.2016"
  end
end
