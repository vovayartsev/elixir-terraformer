defmodule Terraformer.Heroku.Projectors.Addon do
  use Commanded.Projections.Ecto,
    name: "Heroku.Projectors.Addon",
    consistency: :strong

  alias Terraformer.Heroku.Projections.{Addon}
  alias Terraformer.Heroku.Events.{AddonProvisioned}

  project %AddonProvisioned{} = provisioned do
    Ecto.Multi.insert(multi, :addon, %Addon{uuid: provisioned.uuid})
  end
end
