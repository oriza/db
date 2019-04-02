defmodule Db.Rate.Service do
  import Ecto.Query, warn: false

  alias Db.Repo
  alias Db.Rate

  def lists(bank_id \\ 1, currencies \\ ["EUR", "GBP"]) do
    Repo.all from r in Rate,
      where: r.bank_id == ^bank_id,
      where: r.currency in ^currencies
  end

  def create(attrs \\ %{}) do
    %Rate{}
    |> Rate.changeset(attrs)
    |> Repo.insert()
  end

  def update(%Rate{} = rate, attrs) do
    rate
    |> Rate.changeset(attrs)
    |> Repo.update()
  end

  def delete(%Rate{} = rate) do
    Repo.delete(rate)
  end

  def change(%Rate{} = rate) do
    Rate.changeset(rate, %{})
  end
end
