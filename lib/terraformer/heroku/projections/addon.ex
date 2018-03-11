defmodule Terraformer.Heroku.Projections.Addon do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:uuid, :binary_id, autogenerate: false}

  schema "heroku_addons" do
    field :name, :string
    field :vault_id, :string
    timestamps()
  end

  def changeset(addon, params \\ %{}) do
    addon
    |> cast(params, [:vault_id, :name])
  end
end
