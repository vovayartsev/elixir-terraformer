ExUnit.start()

# Ecto.Adapters.SQL.Sandbox.mode(Terraformer.Repo, :manual)
# Ecto.Adapters.SQL.Sandbox.mode(Terraformer.Repo, {:shared, self()})

{:ok, _pid} = Commanded.EventStore.Adapters.InMemory.start_link()
{:ok, _} = Application.ensure_all_started(:terraformer)
