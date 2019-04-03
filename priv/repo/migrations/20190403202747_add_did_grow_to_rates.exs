defmodule Db.Repo.Migrations.AddDidGrowToRates do
  use Ecto.Migration

  def change do
    alter table(:rates) do
      add :did_grow, :boolean, default: true
    end
  end
end
