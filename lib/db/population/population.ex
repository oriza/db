defmodule Db.Population do
  import Ecto.Query, warn: false

  alias Db.Repo
  alias Db.{Site, Category, Calendar, Weather, Bank}
  alias Site.{ArchiveSelector, ArticleSelector}

  def populate_all() do
    populate_sites()
    populate_categories()
    populate_calendar()
    populate_weather()
    populate_banks()
  end

  def populate_sites() do
    Repo.delete_all(ArchiveSelector)
    Repo.delete_all(ArticleSelector)
    Repo.delete_all(Site)

    "lib/db/population/data/sites.json"
    |> File.read!
    |> Jason.decode!
    |> Enum.each(fn site ->
      %{"selectors" => %{"archive" => archive, "article" => article}} = site
      {:ok, site} = Site.Service.create(site)

      ArchiveSelector.Service.create(Map.put(archive, "site_id", site.id))
      ArticleSelector.Service.create(Map.put(article, "site_id", site.id))
    end)
  end

  def populate_categories() do
    Repo.delete_all(Category)

    "lib/db/population/data/categories.json"
    |> File.read!
    |> Jason.decode!
    |> Enum.each(fn category -> Category.Service.create(category) end)
  end

  def populate_calendar() do
    Repo.delete_all(Calendar)

    "lib/db/population/data/calendar.json"
    |> File.read!
    |> Jason.decode!
    |> Enum.each(fn day -> Calendar.Service.create(day) end)
  end

  def populate_weather() do
    Repo.delete_all(Weather)

    "lib/db/population/data/cities.json"
    |> File.read!
    |> Jason.decode!
    |> Enum.each(fn city -> Weather.Service.create(city) end)
  end

  def populate_banks() do
    Repo.delete_all(Bank)

    "lib/db/population/data/banks.json"
    |> File.read!
    |> Jason.decode!
    |> Enum.each(fn bank -> Bank.Service.create(bank) end)
  end
end
