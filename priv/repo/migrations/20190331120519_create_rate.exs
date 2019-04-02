defmodule Db.Repo.Migrations.CreateRate do
  use Ecto.Migration

  def change do
    create table(:rates) do
      add :currency, :string
      add :value, :float
      add :bank_id, references(:banks, on_delete: :nilify_all)

      timestamps()
    end

    create index(:rates, [:bank_id])
  end
end
