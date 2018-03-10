defmodule Terraformer.Heroku.Projections.Addon do
  use Ecto.Schema

  @primary_key {:uuid, :binary_id, autogenerate: false}

  schema "heroku_addons" do
    field :name, :string

    timestamps()
  end
end
