defmodule Terraformer.Heroku.Commands.DeprovisionAddon do
  defstruct [
    uuid: "",
  ]

  use ExConstructor
  use Vex.Struct

  validates :uuid, uuid: true
end
