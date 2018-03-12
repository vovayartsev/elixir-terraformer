defmodule Mix.Tasks.Terraformer.Provision do
  use Mix.Task
  alias Terraformer.Support.JWT

  @shortdoc "Generates a JWT token with new UUID, creates records in DBs"

  @moduledoc """
    This is where we would put any long form documentation or doctests.
  """

  def run(_args) do
    addon_uuid = UUID.uuid4()
    vault_id = SecureRandom.urlsafe_base64(16)
    vault_secret = SecureRandom.urlsafe_base64(64)

    addon_jwt_token = JWT.encode(addon_uuid)
    vault_jwt_token = JWT.encode(vault_id)

    {:ok, _started} = Application.ensure_all_started(:terraformer)
    Terraformer.Heroku.provision_addon(%{uuid: addon_uuid})
    Terraformer.Heroku.attach_vault(%{uuid: addon_uuid, vault_id: vault_id})

    Mix.shell.info "Addon UUID: #{addon_uuid}    (identifier in DB)"
    Mix.shell.info "Vault ID: #{vault_id}    (identifier in DB)"

    Mix.shell.info "TERRAFORMER_TOKEN=#{addon_jwt_token}       # used by CLI tools to talk to Phoenix API and send RPC messages"
    Mix.shell.info "VAULT_TOKEN=#{vault_jwt_token}       # passed to AWS Machine, used to join the channel"
    Mix.shell.info "VAULT_SECRET=#{vault_secret}   # used to encode ENV and CODE"
  end

  # We can define other functions as needed here.
end
