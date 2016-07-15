use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :session_service, SessionService.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :session_service, SessionService.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "session_service_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
