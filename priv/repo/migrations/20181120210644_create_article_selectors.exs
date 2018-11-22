defmodule Db.Repo.Migrations.CreateArticleSelectors do
  use Ecto.Migration

  def change do
    create table(:article_selectors) do
      add :title, :string
      add :authors, :string
      add :published_at, :string
      add :category, :string
      add :content, :string
      add :site_id, references(:sites, on_delete: :nothing)

      timestamps()
    end

    create index(:article_selectors, [:site_id])
  end
end
