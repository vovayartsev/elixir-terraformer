defmodule Terraformer.Heroku.Api.Client do
  alias Terraformer.Support.JWT

  def provision(uuid) do
    IO.puts "POST /addons/#{uuid}/actions/provision HTTP/1.1"
  end

  def set_terraformer_token_var(uuid) do
    update_config(uuid, TERRAFORMER_TOKEN: JWT.encode(uuid))
  end

  defp update_config(uuid, array \\ []) do
    patches = Enum.map(array, &tuple_to_config_map/1)
    IO.puts "PATCH /addons/#{uuid}/config HTTP/1.1"
    IO.puts Poison.encode!(patches)
  end

  defp tuple_to_config_map({key, value}), do: %{name: String.upcase("#{key}"), value: value}
end
