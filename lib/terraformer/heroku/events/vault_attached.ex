defmodule Terraformer.Heroku.Events.VaultAttached do
  @derive [Poison.Encoder]
  defstruct [
    :uuid,
    :vault_id
  ]
end
