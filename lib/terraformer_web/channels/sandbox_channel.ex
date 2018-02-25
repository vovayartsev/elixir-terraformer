defmodule TerraformerWeb.SandboxChannel do
  use Phoenix.Channel

  def join("sandbox:" <> sandbox_name, params, socket) do
    {:ok, socket}
    # {:error, %{reason: "unauthorized"}}
  end

end
