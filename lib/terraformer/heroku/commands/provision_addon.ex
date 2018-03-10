defmodule Terraformer.Heroku.Commands.ProvisionAddon do
  defstruct [
    uuid: "",
  ]

  use ExConstructor
  use Vex.Struct

  alias Terraformer.Heroku.Commands.ProvisionAddon

  validates :uuid, uuid: true
end
