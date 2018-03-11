defmodule Terraformer.Heroku.Aggregates.Addon do
  defstruct [
    uuid: nil,
    vault_id: nil,
    provisioned_at: nil,
    deprovisioned_at: nil
  ]

  alias Terraformer.Heroku.Aggregates.Addon
  alias Terraformer.Heroku.Commands.{
    ProvisionAddon, DeprovisionAddon, AttachVault
  }
  alias Terraformer.Heroku.Events.{
    AddonProvisioned, AddonDeprovisioned, VaultAttached
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

  def execute(%Addon{deprovisioned_at: nil}, %AttachVault{} = attach) do
    %VaultAttached{
      uuid: attach.uuid,
      vault_id: attach.vault_id
    }
  end

  def execute(_, command) do
    {:error, "Unknown command or invalid state: #{inspect(command)}"}
  end

  # state mutators

  def apply(%Addon{} = addon, %AddonProvisioned{} = provisioned) do
    %Addon{addon | uuid: provisioned.uuid, provisioned_at: provisioned.timestamp }
  end

  def apply(%Addon{} = addon, %AddonDeprovisioned{} = deprovisioned) do
    %Addon{addon | deprovisioned_at: deprovisioned.timestamp }
  end

  def apply(%Addon{} = addon, %VaultAttached{} = attached) do
    %Addon{addon | vault_id: attached.vault_id }
  end

end
