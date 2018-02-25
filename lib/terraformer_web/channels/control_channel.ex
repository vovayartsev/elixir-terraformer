defmodule TerraformerWeb.ControlChannel do
  use Phoenix.Channel

  def join("control:" <> sandbox_name, params, socket) do
    {:ok, socket}
    # {:error, %{reason: "unauthorized"}}
  end

  def handle_in(message, body, socket) do
    TerraformerWeb.Endpoint.broadcast_from! self(), "sandbox:orange-apple-123", message, body
    {:noreply, socket}
  end

end
