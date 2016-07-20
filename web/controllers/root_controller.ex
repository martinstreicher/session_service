defmodule SessionService.RootController do
  use SessionService.Web, :controller

  def index(conn, _params) do
    json conn, %{id: "hello"}
  end
end
