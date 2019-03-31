defmodule Db.Calendar do
  use Ecto.Schema
  import Ecto.Changeset

  schema "calendar" do
    field :date, :string
    field :name, :string
    field :holiday, :string

    timestamps()
  end

  def changeset(calendar, attrs) do
    calendar
    |> cast(attrs, [:date, :name, :holiday])
    |> validate_required([:date])
    |> unique_constraint(:date)
  end
end
