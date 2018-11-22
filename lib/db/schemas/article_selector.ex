defmodule Db.Schema.ArticleSelector do
  use Ecto.Schema
  import Ecto.Changeset

  schema "article_selectors" do
    field :title, :string
    field :authors, :string
    field :published_at, :string
    field :category, :string
    field :content, :string

    belongs_to :site, Db.Schema.Site

    timestamps()
  end

  def changeset(selectors, attrs) do
    selectors
    |> cast(attrs, [:title, :authors, :published_at, :category, :content, :site_id])
  end
end