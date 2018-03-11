defmodule Terraformer.Heroku.Api.Client do
  def provision(uuid) do
    IO.puts "POST /addons/#{uuid}/actions/provision HTTP/1.1"
  end
end
