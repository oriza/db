defmodule Db.Repo.Migrations.AddArchiveToSites do
  use Ecto.Migration

  def change do
    alter table(:sites) do
      add :archive, :string
    end
  end
end
