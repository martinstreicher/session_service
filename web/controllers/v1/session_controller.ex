defmodule SessionService.V1.SessionController do
  use SessionService.Web, :controller
  use Guardian.Phoenix.Controller

  plug :scrub_params, "session" when action in [:create]

  def create(conn, _params) do
    conn
  end

  def show(conn, %{id: id}) do
    render conn, "show.json"
  end

  def login(conn, params) do
    case User.find_and_confirm_password(params) do
      {:ok, user} ->
         new_conn = Guardian.Plug.api_sign_in(conn, user)
         jwt = Guardian.Plug.current_token(new_conn)
         claims = Guardian.Plug.claims(new_conn)
         exp = Map.get(claims, "exp")

         new_conn
         |> put_resp_header("authorization", "Bearer #{jwt}")
         |> put_resp_header("x-expires", exp)
         |> render("login.json", user: user, jwt: jwt, exp: exp)
      {:error, changeset} ->
        conn
        |> put_status(401)
        |> render("error.json", message: "Could not login")
    end
  end

  def logout(conn, _params) do
    jwt = Guardian.Plug.current_token(conn)
    claims = Guardian.Plug.claims(conn)
    Guardian.revoke!(jwt, claims)
    render "logout.json"
  end
end
