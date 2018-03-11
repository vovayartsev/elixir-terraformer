defmodule Terraformer.Heroku.Events.AddonDeprovisioned do
  @derive [Poison.Encoder]
  defstruct [
    :uuid,
    :timestamp
  ]
end
