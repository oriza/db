defmodule Db.Bank do
  use Ecto.Schema
  import Ecto.Changeset

  schema "banks" do
    field :name, :string
    field :slug, :string
    field :description, :string

    has_many :rates, Db.Rate

    timestamps()
  end

  def changeset(bank, attrs) do
    bank
    |> cast(attrs, [:name, :slug, :description])
  end
end
