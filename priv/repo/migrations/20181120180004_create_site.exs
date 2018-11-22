defmodule Db.Repo.Migrations.CreateSite do
  use Ecto.Migration

  def change do
    create table(:sites) do
      add :name, :string
      add :url, :string, unique: true
      add :feed, :string
      add :slug, :string
      add :state, :string

      timestamps()
    end
  end
end
