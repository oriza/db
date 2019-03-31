defmodule Db.Repo.Migrations.CreateWeather do
  use Ecto.Migration

  def change do
    create table(:weather) do
      add :city, :string, unique: true
      add :openweather_id, :integer, unique: true
      add :longitude, :float
      add :latitude, :float
      add :current_temperature, :float
      add :minimum_temperature, :float
      add :maximum_temperature, :float
      add :icon, :string
      add :description, :text

      timestamps()
    end
  end
end
