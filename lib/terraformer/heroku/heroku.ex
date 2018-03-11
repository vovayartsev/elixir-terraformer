defmodule Terraformer.Heroku do
  alias Terraformer.Heroku.Commands.{ProvisionAddon, DeprovisionAddon}
  alias Terraformer.Heroku.Projections.{Addon}
  alias Terraformer.{Repo,Router}

  def get_addon!(uuid), do: Repo.get!(Addon, uuid)

  def provision_addon(%{uuid: uuid} = attrs) do
    provision_addon = ProvisionAddon.new(attrs)
    with :ok <- Router.dispatch(provision_addon, consistency: :strong) do
      get_addon!(uuid)
    else
      reply -> reply
    end
  end

  def deprovision_addon(%{uuid: uuid} = attrs) do
    deprovision_addon = DeprovisionAddon.new(attrs)
    Router.dispatch(deprovision_addon, consistency: :strong)
  end
end
