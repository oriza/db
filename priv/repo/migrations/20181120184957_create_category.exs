defmodule Db.Repo.Migrations.CreateCategory do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :alias, {:array, :string}

      timestamps()
    end
  end
end
