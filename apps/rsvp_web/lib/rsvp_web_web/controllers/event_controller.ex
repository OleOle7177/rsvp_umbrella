defmodule RsvpWebWeb.EventController do
  use RsvpWebWeb, :controller

  def show(conn, params) do
    render conn, "details.html", events: "Events #{params["id"]}"
  end
end
