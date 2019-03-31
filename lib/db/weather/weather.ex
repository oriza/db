defmodule Db.Weather do
  use Ecto.Schema
  import Ecto.Changeset

  schema "weather" do
    field :city, :string
    field :openweather_id, :integer
    field :longitude, :float
    field :latitude, :float
    field :current_temperature, :float
    field :minimum_temperature, :float
    field :maximum_temperature, :float
    field :icon, :string
    field :description, :string

    timestamps()
  end

  def changeset(weather, attrs) do
    weather
    |> cast(attrs, [:city, :openweather_id, :longitude, :latitude, :current_temperature, :minimum_temperature, :maximum_temperature, :icon, :description])
    |> validate_required([:openweather_id])
    |> unique_constraint(:city)
    |> unique_constraint(:openweather_id)
  end
end
