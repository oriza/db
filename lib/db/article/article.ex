defmodule Db.Article do
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field :title, :string
    field :url, :string
    field :description, :string
    field :html, :string
    field :content, :string
    field :text, :string
    field :published_at, :utc_datetime
    field :author, :string
    field :extracted, :boolean, default: false

    belongs_to :site, Db.Site
    belongs_to :category, Db.Category

    timestamps()
  end

  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :url, :description, :html, :content, :text, :published_at, :author, :extracted, :site_id, :category_id])
    |> validate_required([:url])
    |> unique_constraint(:url)
  end
end
