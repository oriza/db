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
    attrs_with_grow = attrs |> Map.put(:did_grow, did_grow(rate, attrs))

    rate
    |> Rate.changeset(attrs_with_grow)
    |> Repo.update()
  end

  def delete(%Rate{} = rate) do
    Repo.delete(rate)
  end

  def change(%Rate{} = rate) do
    Rate.changeset(rate, %{})
  end

  defp did_grow(old_rate, new_rate) do
    cond do
      old_rate.value == new_rate.value ->
        old_rate.did_grow
      old_rate.value > new_rate.value ->
        true
      old_rate.value < new_rate.value ->
        false
    end
  end
end
