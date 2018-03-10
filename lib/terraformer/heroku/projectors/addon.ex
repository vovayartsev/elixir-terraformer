defmodule Terraformer.Heroku.Projectors.Addon do
  use Commanded.Projections.Ecto,
    name: "Heroku.Projectors.Addon",
    consistency: :strong

  alias Terraformer.Heroku.Projections.{Addon}
  alias Terraformer.Heroku.Events.{AddonProvisioned}

  project %AddonProvisioned{} = provisioned do
    # IO.puts "PROJECTING: #{inspect(provisioned)}"
    # Terraformer.Repo.insert!(%Addon{uuid: provisioned.uuid})   <---- Uncommenting this fixes the tests
    Ecto.Multi.insert(multi, :addon, %Addon{uuid: provisioned.uuid})
  end
end
