defmodule Db.Rate do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rates" do
    field :currency, :string
    field :value, :float

    belongs_to :bank, Db.Bank

    timestamps()
  end

  def changeset(rate, attrs) do
    rate
    |> cast(attrs, [:currency, :value, :bank_id])
  end
end
