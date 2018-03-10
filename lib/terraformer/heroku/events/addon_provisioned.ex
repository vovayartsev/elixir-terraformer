defmodule Terraformer.Heroku.Events.AddonProvisioned do
  @derive [Poison.Encoder]
  defstruct [
    :uuid,
  ]
end
