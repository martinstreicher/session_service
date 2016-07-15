defmodule SessionService.PageController do
  use SessionService.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
