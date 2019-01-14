defmodule Db.Repo.Migrations.CreateArticle do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :url, :string, unique: true
      add :description, :text
      add :html, :text
      add :text, :text
      add :published_at, :utc_datetime

      timestamps()
    end

    create unique_index(:articles, [:url])
  end
end
