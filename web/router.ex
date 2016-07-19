defmodule SessionService.Router do
  use SessionService.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  # Other scopes may use custom stacks.
  scope "/api", SessionService do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      
    end
  end
end
