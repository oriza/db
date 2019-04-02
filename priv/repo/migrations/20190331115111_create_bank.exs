defmodule Db.Repo.Migrations.CreateBank do
  use Ecto.Migration

  def change do
    create table(:banks) do
      add :name, :string, unique: true
      add :slug, :string, unique: true
      add :description, :text

      timestamps()
    end

    create unique_index(:banks, [:name, :slug])
  end
end
