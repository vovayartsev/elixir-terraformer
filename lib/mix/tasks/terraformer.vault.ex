defmodule Mix.Tasks.Terraformer.Vault do
  use Mix.Task
  alias Terraformer.Support.JWT

  @shortdoc "Generates a Vault ID and Secret"

  def run(_args) do
    vault_id = SecureRandom.urlsafe_base64(16)
    vault_secret = SecureRandom.urlsafe_base64(64)
    jwt_token = JWT.encode(vault_id)
    Mix.shell.info "Vault ID: #{vault_id}    (identifier in DB)"
    Mix.shell.info "VAULT_TOKEN: #{jwt_token}       # passed to AWS Machine, used to join the channel"
    Mix.shell.info "VAULT_SECRET: #{vault_secret}   # used to encode ENV and CODE"
  end

  # We can define other functions as needed here.
end
