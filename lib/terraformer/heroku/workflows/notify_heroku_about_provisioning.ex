defmodule Terraformer.Heroku.Workflows.NotifyHerokuAboutProvisionings do
  use Commanded.Event.Handler,
    name: "Heroku.Workflows.NotifyHerokuAboutProvisionings",
    consistency: :strong

  alias Terraformer.Heroku.Events.AddonProvisioned
  alias Terraformer.Heroku.Api.Client

  def handle(%AddonProvisioned{uuid: uuid}, _metadata) do
    Client.provision(uuid)
  end
end
