defmodule SessionService.Router do
  use SessionService.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  # Other scopes may use custom stacks.
  scope "/api", SessionService do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      post "/login", SessionController, :login
      resources "/sessions", SessionController, only: [:create, :show]
    end
  end
end
