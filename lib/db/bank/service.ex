defmodule Db.Bank.Service do
  import Ecto.Query, warn: false

  alias Db.Repo
  alias Db.Bank

  def lists() do
    Repo.all from b in Bank
  end

  def get!(id), do: Repo.get!(Bank, id) |> preload(:rates)

  def get_by_name!(slug), do: Repo.get_by!(Bank, slug: slug) |> Repo.preload(:rates)

  def create(attrs \\ %{}) do
    %Bank{}
    |> Bank.changeset(attrs)
    |> Repo.insert()
  end

  def update(%Bank{} = site, attrs) do
    site
    |> Bank.changeset(attrs)
    |> Repo.update()
  end

  def delete(%Bank{} = site) do
    Repo.delete(site)
  end

  def change(%Bank{} = site) do
    Bank.changeset(site, %{})
  end
end
