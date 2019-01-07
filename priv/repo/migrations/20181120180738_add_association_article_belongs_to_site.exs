defmodule Db.Repo.Migrations.AddAssociationArticleBelongsToSite do
  use Ecto.Migration

  def change do
    alter table(:articles) do
      add :site_id, references(:sites, on_delete: :nilify_all)
    end

    create index(:articles, [:site_id])
  end
end
