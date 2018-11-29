defmodule Db.Service.Site do
  import Ecto.Query, warn: false

  alias Db.Repo
  alias Db.Schema.Site

  @doc """
  Returns the list of sites.

  ## Examples

      iex> list()
      [%Site{}, ...]

  """
  def lists do
    Repo.all(Site) |> Repo.preload([:archive_selector, :article_selector])
  end

  @doc """
  Returns the number of sites.

  ## Examples

      iex> count()
      1

  """
  def count do
    Repo.one(from c in "sites", select: count(c.id))
  end

  @doc """
  Gets a single site.

  Raises `Ecto.NoResultsError` if the Site does not exist.

  ## Examples

      iex> get!(123)
      %Site{}

      iex> get!(456)
      ** (Ecto.NoResultsError)

  """
  def get!(id), do: Repo.get!(Site, id)

  @doc """
  Creates a site.

  ## Examples

      iex> create(%{field: value})
      {:ok, %Site{}}

      iex> create(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create(attrs \\ %{}) do
    %Site{}
    |> Site.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a site.

  ## Examples

      iex> update(site, %{field: new_value})
      {:ok, %Site{}}

      iex> update(site, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update(%Site{} = site, attrs) do
    site
    |> Site.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Site.

  ## Examples

      iex> delete(site)
      {:ok, %Site{}}

      iex> delete(site)
      {:error, %Ecto.Changeset{}}

  """
  def delete(%Site{} = site) do
    Repo.delete(site)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking site changes.

  ## Examples

      iex> change(site)
      %Ecto.Changeset{source: %Site{}}

  """
  def change(%Site{} = site) do
    Site.changeset(site, %{})
  end
end