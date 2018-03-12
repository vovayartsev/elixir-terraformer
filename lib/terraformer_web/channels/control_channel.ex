defmodule TerraformerWeb.ControlChannel do
  use Phoenix.Channel
  alias Terraformer.Support.JWT
  alias Terraformer.Repo
  alias Terraformer.Heroku.Projections.Addon

  def join("control:" <> addon_uuid, %{"token" => jwt_token}, socket) do
    with {:ok, _} <- JWT.validate_for_sub(jwt_token, addon_uuid) do
      addon = Repo.get(Addon, addon_uuid)
      if addon do
        {:ok, assign(socket, :addon, addon)}
      else
        {:error, %{reason: "unauthorized: addon #{addon_uuid} is not registered"}}
      end
    else
      {:error, reason} -> {:error, %{reason: "unauthorized: #{reason}"}}
    end
  end

  def handle_in(message, body, socket) do
    %{addon: addon} = socket.assigns
    body_extended = Map.put(body, "addon_uuid", addon.uuid)
    TerraformerWeb.Endpoint.broadcast_from! self(), "vault:#{addon.vault_id}", message, body_extended
    {:noreply, socket}
  end
end
