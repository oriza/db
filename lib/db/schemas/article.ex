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
    field :extracted, :boolean, default: false

    belongs_to :site, Db.Schema.Site
    belongs_to :category, Db.Schema.Category

    timestamps()
  end

  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :url, :description, :html, :text, :published_at, :author, :extracted, :site_id, :category_id])
    |> format_datetime()
    |> validate_required([:url])
    |> unique_constraint(:url)
  end

  defp format_datetime(%Ecto.Changeset{valid?: true, changes: %{published_at: published_at}} = changeset) do
    change(changeset, published_at: Timex.format(published_at) || nil)
  end
end
