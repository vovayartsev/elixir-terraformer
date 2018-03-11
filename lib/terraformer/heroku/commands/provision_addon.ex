defmodule Terraformer.Heroku.Commands.ProvisionAddon do
  defstruct [
    uuid: "",
  ]

  use ExConstructor
  use Vex.Struct

  validates :uuid, uuid: true
end
