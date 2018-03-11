defmodule Terraformer.Router do
  use Commanded.Commands.Router

  alias Terraformer.Heroku
  alias Terraformer.Heroku.Commands.{
    ProvisionAddon, DeprovisionAddon, AttachVault
  }

  # alias Terraformer.Support.Middleware.{Uniqueness,Validate}
  # middleware Validate
  # middleware Uniqueness

  identify Heroku.Aggregates.Addon, by: :uuid, prefix: "heroku-addon-"

  dispatch [ ProvisionAddon, DeprovisionAddon, AttachVault ], to: Heroku.Aggregates.Addon

end
