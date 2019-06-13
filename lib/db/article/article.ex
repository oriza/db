defmodule Db.Article do
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field :title, :string
    field :url, :string
    field :description, :string
    field :html, :string
    field :content, :string
    field :published_at, :utc_datetime
    field :author, :string
    field :extracted, :boolean, default: false

    belongs_to :site, Db.Site
    belongs_to :category, Db.Category

    timestamps()
  end

  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :url, :description, :html, :content, :published_at, :author, :extracted, :site_id, :category_id])
    |> validate_required([:url])
    |> unique_constraint(:url)
    |> format_text(:title)
    |> format_text(:description)
    |> format_text(:content)
  end

  defp format_text(changeset, key) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: changes} ->
        if changes[key] != nil do
          put_change(changeset, key, remove_tags(changes[key]))
        else
          changeset
        end
      _ ->
        changeset
    end
  end

  defp remove_tags(nil), do: ""
  defp remove_tags(text), do: String.replace(text, ~r/<[^>]*>/, "")
end
