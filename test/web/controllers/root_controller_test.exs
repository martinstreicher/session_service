defmodule SessionService.RootControllerTest do
  use SessionService.ConnCase

  @invalid_attrs %{}

  @valid_attrs %{}

  setup %{conn: conn} do
    { :ok, conn: put_req_header(conn, "accept", "application/json") }
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, "/"
    assert json_response(conn, 200)["id"] == "hello"
  end
end
