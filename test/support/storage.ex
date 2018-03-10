defmodule Terraformer.Storage do
  @doc """
  Clear the event store and read store databases
  """
  def reset! do
    Application.stop(:terraformer)
    Application.stop(:commanded)

    reset_eventstore()

    {:ok, _} = Application.ensure_all_started(:terraformer)

    reset_readstore()
  end

  defp reset_eventstore do
    {:ok, _event_store} = Commanded.EventStore.Adapters.InMemory.start_link()
  end

  def reset_readstore do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Terraformer.Repo)

    Ecto.Adapters.SQL.Sandbox.mode(Terraformer.Repo, {:shared, self()})
  end
end
