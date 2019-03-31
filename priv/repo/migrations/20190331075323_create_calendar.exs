defmodule Db.Repo.Migrations.CreateCalendar do
  use Ecto.Migration

  def change do
    create table(:calendar) do
      add :date, :string, unique: true
      add :name, :string
      add :holiday, :string

      timestamps()
    end
  end
end
