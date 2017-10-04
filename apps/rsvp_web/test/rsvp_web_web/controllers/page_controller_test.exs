defmodule RsvpWebWeb.PageControllerTest do
  use RsvpWebWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to RS!"
  end
end
