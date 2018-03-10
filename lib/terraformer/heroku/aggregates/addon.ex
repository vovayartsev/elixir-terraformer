defmodule Terraformer.Heroku.Aggregates.Addon do
  defstruct [
    uuid: nil,
  ]

  alias Terraformer.Heroku.Aggregates.Addon

  alias Terraformer.Heroku.Commands.{
    ProvisionAddon,
  }

  alias Terraformer.Heroku.Events.{
    AddonProvisioned,
  }

  def execute(%Addon{uuid: nil}, %ProvisionAddon{} = provision) do
    %AddonProvisioned{
      uuid: provision.uuid,
    }
  end

  # state mutators

  def apply(%Addon{} = addon, %AddonProvisioned{} = provisioned) do
    %Addon{addon | uuid: provisioned.uuid }
  end
end
