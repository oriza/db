defmodule Db.Repo.Migrations.AddExtractedToArticle do
  use Ecto.Migration

  def change do
    alter table(:articles) do
      add :extracted, :boolean
    end
  end
end
