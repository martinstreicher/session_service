defmodule SessionService.V1.SessionController do
  require Logger
  use SessionService.Web, :controller
  alias SessionService.Session

  plug :scrub_params, "session" when action in [:create]

  def create(conn, %{"session" => session_params}) do
    changeset = Session.changeset(%Session{}, session_params)
    case Repo.insert(changeset) do
      {:ok, session} ->
        render(conn, "show.json", session: session)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(SessionService.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    session = Repo.get(SessionService.Session, id)
    render conn, "show.json", session: session
  end
end
