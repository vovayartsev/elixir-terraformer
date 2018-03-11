defmodule Terraformer.Heroku.Workflows.NotifyHerokuAboutProvisioning do
  use Commanded.Event.Handler,
    name: "Heroku.Workflows.NotifyHerokuAboutProvisioning",
    consistency: :strong

  alias Terraformer.Heroku.Events.AddonProvisioned
  alias Terraformer.Heroku.Api.Client

  def handle(%AddonProvisioned{uuid: uuid}, _metadata) do
    Client.set_terraformer_token_var(uuid)
    Client.provision(uuid)
  end
end
