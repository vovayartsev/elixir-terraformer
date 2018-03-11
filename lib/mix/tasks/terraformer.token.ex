defmodule Mix.Tasks.Terraformer.Token do
  use Mix.Task
  alias Terraformer.Support.JWT

  @shortdoc "Generates a JWT token with new UUID"

  @moduledoc """
    This is where we would put any long form documentation or doctests.
  """

  def run(_args) do
    jwt_token = JWT.encode(UUID.uuid4())
    Mix.shell.info jwt_token
    # Mix.shell.info JWT.decode!(jwt_token) |> inspect
  end

  # We can define other functions as needed here.
end
