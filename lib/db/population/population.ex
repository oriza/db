defmodule Db.Population do
  import Ecto.Query, warn: false

  alias Db.{Repo, Schema}
  alias Db.Service.{Site, ArchiveSelector, ArticleSelector, Category}

  def populate_sites() do
    Repo.delete_all(Schema.ArchiveSelector)
    Repo.delete_all(Schema.ArticleSelector)
    Repo.delete_all(Schema.Site)
    
    "lib/db/population/data/sites.json"
    |> File.read!
    |> Jason.decode!
    |> Enum.each(fn site ->
      %{"selectors" => %{"archive" => archive, "article" => article}} = site
      {:ok, %{id: site_id}} = Site.create(site)

      ArchiveSelector.create(Map.put(archive, "site", site))
      ArticleSelector.create(Map.put(article, "site_id", site_id))
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
