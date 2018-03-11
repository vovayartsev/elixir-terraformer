defmodule Terraformer.Heroku.Aggregates.Addon do
  defstruct [
    uuid: nil,
    provisioned_at: nil,
    deprovisioned_at: nil
  ]

  alias Terraformer.Heroku.Aggregates.Addon

  alias Terraformer.Heroku.Commands.{
    ProvisionAddon, DeprovisionAddon
  }

  alias Terraformer.Heroku.Events.{
    AddonProvisioned, AddonDeprovisioned
  }

  def execute(%Addon{provisioned_at: nil}, %ProvisionAddon{} = provision) do
    %AddonProvisioned{
      uuid: provision.uuid,
      timestamp: DateTime.utc_now()
    }
  end

  def execute(%Addon{deprovisioned_at: nil}, %DeprovisionAddon{} = deprovision) do
    %AddonDeprovisioned{
      uuid: deprovision.uuid,
      timestamp: DateTime.utc_now()
    }
  end

  # state mutators

  def apply(%Addon{} = addon, %AddonProvisioned{} = provisioned) do
    %Addon{addon | uuid: provisioned.uuid, provisioned_at: provisioned.timestamp }
  end

  def apply(%Addon{} = addon, %AddonDeprovisioned{} = deprovisioned) do
    %Addon{addon | deprovisioned_at: deprovisioned.timestamp }
  end
end
