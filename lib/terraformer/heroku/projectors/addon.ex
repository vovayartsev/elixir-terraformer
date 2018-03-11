defmodule Terraformer.Heroku.Projectors.Addon do
  use Commanded.Projections.Ecto,
  name: "Heroku.Projectors.Addon",
  consistency: :strong

  alias Terraformer.Heroku.Projections.{Addon}
  alias Terraformer.Heroku.Events.{AddonProvisioned, AddonDeprovisioned, VaultAttached}

  project %AddonProvisioned{} = provisioned do
    Ecto.Multi.insert(multi, :addon, %Addon{uuid: provisioned.uuid})
  end

  project %AddonDeprovisioned{} = deprovisioned do
    Ecto.Multi.delete(multi, :addon, %Addon{uuid: deprovisioned.uuid})
  end

  project %VaultAttached{} = attached do
    changeset = Addon.changeset( %Addon{uuid: attached.uuid}, %{vault_id: attached.vault_id} )
    Ecto.Multi.update(multi, :addon, changeset)
  end

end
