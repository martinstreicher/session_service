# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

use Mix.Config

#
# General application configuration
config :session_service,
  ecto_repos: [SessionService.Repo]

#
# Configures the endpoint
config :session_service, SessionService.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ryFzQE38giM/iJgsOL4YoY6ZCCeCrW2FVYflK4Xd65hHW/qI8qdbUIZb/jI0XFGO",
  render_errors: [view: SessionService.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SessionService.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :guardian_db, GuardianDb,
       repo: SessionService.Repo,
       sweep_interval: 120 # 120 minutes

# Integration tests require chromedriver to be running
config :hound, driver: "chrome_driver"
config :hound, app_host: "http://localhost", app_port: 4000

#
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

#
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
