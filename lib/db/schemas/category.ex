defmodule Db.Schema.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :name, :string
    field :alias, {:array, :string}

    has_many :articles, Db.Schema.Article

    timestamps()
  end

  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :alias])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end 
end