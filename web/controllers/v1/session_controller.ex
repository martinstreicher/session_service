defmodule SessionService.V1.SessionController do
  use SessionService.Web, :controller

  plug :scrub_params, "session" when action in [:create]

  def create(conn, _params) do
    conn
  end

  def show(conn, %{id: id}) do
    render conn, "show.json"
  end
end
