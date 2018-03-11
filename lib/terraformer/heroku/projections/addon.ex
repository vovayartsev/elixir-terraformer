defmodule Terraformer.Heroku.Projections.Addon do
  use Ecto.Schema

  @primary_key {:uuid, :binary_id, autogenerate: false}

  schema "heroku_addons" do
    field :name, :string
    field :vault_id, :string
    timestamps()
  end
end
