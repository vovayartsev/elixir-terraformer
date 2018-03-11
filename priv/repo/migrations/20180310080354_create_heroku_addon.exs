defmodule Terraformer.Repo.Migrations.CreateHerokuAddon do
  use Ecto.Migration

  def change do
    create table(:heroku_addons, primary_key: false) do
      add :uuid, :uuid, primary_key: true
      add :name, :string, size: 60
      add :vault_id, :string, size: 60
      timestamps()
    end

    create index(:heroku_addons, [:name])
  end
end
