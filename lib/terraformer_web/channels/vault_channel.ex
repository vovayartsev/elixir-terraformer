defmodule TerraformerWeb.VaultChannel do
  use Phoenix.Channel
  alias Terraformer.Support.JWT

  def join("vault:" <> vault_id, %{"token" => jwt_token}, socket) do
    with {:ok, _} <- JWT.validate_for_sub(jwt_token, vault_id) do
      {:ok, assign(socket, :vault_id, vault_id)}
    else
      {:error, reason} -> {:error, %{reason: "unauthorized: #{reason}"}}
    end
  end

  def handle_in(message, %{"addon_uuid" => addon_uuid} = body, socket) do
    TerraformerWeb.Endpoint.broadcast_from! self(), "control:#{addon_uuid}", message, body
    {:noreply, socket}
  end

end
