defmodule Db.Repo.Migrations.AddAssociationArticleBelongsToCategory do
  use Ecto.Migration

  def change do
    alter table(:articles) do
      add :category_id, references(:categories, on_delete: :nilify_all)
    end

    create index(:articles, [:category_id])
  end
end
