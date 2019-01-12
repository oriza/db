defmodule Db.Population do
  import Ecto.Query, warn: false

  alias Db.Repo
  alias Db.{Site, Category}
  alias Site.{ArchiveSelector, ArticleSelector}

  def populate_all() do
    populate_sites()
    populate_categories()
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
end
