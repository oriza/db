defmodule Db.Repo.Migrations.AddAuthorToArticle do
  use Ecto.Migration

  def change do
    alter table(:articles) do
      add :author, :string
    end
  end
end
