defmodule Db.Schema.ArchiveSelector do
  use Ecto.Schema
  import Ecto.Changeset

  schema "archive_selectors" do
    field :container, :string
    field :title, :string
    field :authors, :string
    field :description, :string
    field :published_at, :string
    field :category, :string

    belongs_to :site, Db.Schema.Site

    timestamps()
  end

  def changeset(selectors, attrs) do
    selectors
    |> cast(attrs, [:container, :title, :authors, :authors, :description, :published_at, :category, :site_id])
  end
end