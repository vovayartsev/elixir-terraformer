defmodule Terraformer.DataCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Terraformer.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      # import Terraformer.Factory
      # import Terraformer.Fixture
      import Terraformer.DataCase
    end
  end

  setup do
    Terraformer.Storage.reset!()

    :ok
  end
end
