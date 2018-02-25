defmodule TerraformerWeb.SandboxChannel do
  use Phoenix.Channel

  def join("sandbox:" <> sandbox_name, params, socket) do
    {:ok, socket}
    # {:error, %{reason: "unauthorized"}}
  end

  def handle_in(message, body, socket) do
    TerraformerWeb.Endpoint.broadcast_from! self(), "control:orange-apple-123", message, body
    {:noreply, socket}
  end

end
