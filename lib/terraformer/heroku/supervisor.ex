defmodule Terraformer.Heroku.Supervisor do
  use Supervisor

  alias Terraformer.Heroku

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_arg) do
    Supervisor.init([
      Heroku.Projectors.Addon,
    ], strategy: :one_for_one)
  end
end
