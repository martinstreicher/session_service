defmodule SessionService.V1.SessionView do
  use SessionService.Web, :view

  def render("index.json", %{sessions: sessions}) do
    %{data: render_many(sessions, SessionService.V1.SessionView, "session.json")}
  end

  def render("show.json", %{session: session}) do
    %{data: render_one(session, SessionService.V1.SessionView, "session.json")}
  end

  def render("session.json", %{session: session}) do
    %{id: session.id}
  end
end
