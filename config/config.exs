# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :whale,
  ecto_repos: [Whale.Repo]

# Configures the endpoint
config :whale, WhaleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DDsaUGj9gs1R93ROQTG8GYZL2NNjo7i9RlG1ndb9Cax2pNGz16JyZQPQtWOHHWe0",
  render_errors: [view: WhaleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Whale.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
