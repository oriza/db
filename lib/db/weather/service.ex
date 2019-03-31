defmodule Db.Weather.Service do
  import Ecto.Query, warn: false

  alias Db.Repo
  alias Db.Weather

  def lists() do
    Repo.all from w in Weather
  end

  def get_by!(city) do
    Repo.get_by!(Weather, city: city)
  end

  def create(attrs \\ %{}) do
    %Weather{}
    |> Weather.changeset(attrs)
    |> Repo.insert()
  end

  def update(%Weather{} = weather, attrs) do
    weather
    |> Weather.changeset(attrs)
    |> Repo.update()
  end

  def change(%Weather{} = weather) do
    Weather.changeset(weather, %{})
  end
end
