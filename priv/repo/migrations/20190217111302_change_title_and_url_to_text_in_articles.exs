defmodule Db.Repo.Migrations.ChangeTitleAndUrlToTextInArticles do
  use Ecto.Migration

  def change do
    alter table(:articles) do
      modify :title, :text
      modify :url, :text
    end
  end
end
