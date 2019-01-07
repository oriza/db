defmodule Db.Population do
  import Ecto.Query, warn: false

  alias Db.{Repo, Schema}
  alias Db.Service.{Site, ArchiveSelector, ArticleSelector, Category}

  def populate_all() do
    populate_sites()
    populate_categories()
  end

  def populate_sites() do
    Repo.delete_all(Schema.ArchiveSelector)
    Repo.delete_all(Schema.ArticleSelector)
    Repo.delete_all(Schema.Site)

    "lib/db/population/data/sites.json"
    |> File.read!
    |> Jason.decode!
    |> Enum.each(fn site ->
      %{"selectors" => %{"archive" => archive, "article" => article}} = site
      {:ok, site} = Site.create(site)

      ArchiveSelector.create(Map.put(archive, "site_id", site.id))
      ArticleSelector.create(Map.put(article, "site_id", site.id))
    end)
  end

  def populate_categories() do
    Repo.delete_all(Schema.Category)

    "lib/db/population/data/categories.json"
    |> File.read!
    |> Jason.decode!
    |> Enum.each(fn category -> Category.create(category) end)
  end
end
