defmodule Db.Site do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sites" do
    field :name, :string
    field :url, :string
    field :feed, :string
    field :archive, :string
    field :slug, :string
    field :state, :string

    has_many :articles, Db.Article
    has_one :archive_selector, Db.Site.ArchiveSelector
    has_one :article_selector, Db.Site.ArticleSelector

    timestamps()
  end

  def changeset(site, attrs) do
    site
    |> cast(attrs, [:name, :url, :feed, :archive, :slug, :state])
    |> validate_required([:url, :slug])
    |> unique_constraint(:url)
    |> unique_constraint(:slug)
  end
end
