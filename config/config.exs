# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixir_phoenix_template,
  ecto_repos: [ElixirPhoenixTemplate.Repo]

# Configures the endpoint
config :elixir_phoenix_template, ElixirPhoenixTemplateWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GD/tbw3OLl0feDMSDjX652lccnqtJkdzq1CPpuTp6gScf6HpJXZrj21Lf1Ml4E81",
  render_errors: [view: ElixirPhoenixTemplateWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirPhoenixTemplate.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "Wxfa8P4K"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
