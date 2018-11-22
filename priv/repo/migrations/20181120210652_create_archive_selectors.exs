defmodule Db.Repo.Migrations.CreateArchiveSelectors do
  use Ecto.Migration

  def change do
    create table(:archive_selectors) do
      add :container, :string
      add :title, :string
      add :authors, :string
      add :description, :string
      add :published_at, :string
      add :category, :string
      add :site_id, references(:sites, on_delete: :nothing)

      timestamps()
    end

    create index(:archive_selectors, [:site_id])
  end
end
