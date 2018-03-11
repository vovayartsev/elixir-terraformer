defmodule Terraformer.Router do
  use Commanded.Commands.Router

  alias Terraformer.Heroku
  alias Terraformer.Heroku.Commands.{
    ProvisionAddon,
  }

  # alias Terraformer.Support.Middleware.{Uniqueness,Validate}
  # middleware Validate
  # middleware Uniqueness

  identify Heroku.Aggregates.Addon, by: :uuid, prefix: "heroku-addon-"

  dispatch [ ProvisionAddon ], to: Heroku.Aggregates.Addon

end
