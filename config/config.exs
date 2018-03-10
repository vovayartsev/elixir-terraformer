# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :terraformer,
  ecto_repos: [Terraformer.Repo]

# Configures the endpoint
config :terraformer, TerraformerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "21LaF6jdNkdf8zJ8nwvKU2SSVrsx0mhk0b/Z25myzISObwcOyTXaBhdG6TQiIrwg",
  render_errors: [view: TerraformerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Terraformer.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


config :commanded_ecto_projections,
  repo: Terraformer.Repo

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
