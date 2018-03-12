defmodule Terraformer.Heroku.Commands.AttachVault do
  defstruct [
    uuid: "",
    vault_id: ""
  ]

  use ExConstructor
  use Vex.Struct

  validates :uuid, uuid: true
end
