defmodule Db.Schema.Article do
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field :title, :string
    field :url, :string
    field :description, :string
    field :html, :string
    field :text, :string
    field :published_at, :utc_datetime
    field :author, :string

    belongs_to :site, Db.Schema.Site
    belongs_to :category, Db.Schema.Category

    timestamps()
  end

  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :url, :description, :html, :text, :published_at, :author, :site_id, :category_id])
    |> validate_required([:url])
    |> unique_constraint(:url)
  end
end
