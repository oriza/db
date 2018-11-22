defmodule Db.Service.ArchiveSelector do
  import Ecto.Query, warn: false

  alias Db.Repo
  alias Db.Schema.ArchiveSelector

  @doc """
  Returns the list of archive_selectors.

  ## Examples

      iex> list()
      [%ArchiveSelector{}, ...]

  """
  def lists do
    Repo.all(ArchiveSelector)
  end

  @doc """
  Returns the number of archive_selectors.

  ## Examples

      iex> count()
      1

  """
  def count do
    Repo.one(from c in "archive_selectors", select: count(c.id))
  end

  @doc """
  Gets a single archive_selector.

  Raises `Ecto.NoResultsError` if the ArchiveSelector does not exist.

  ## Examples

      iex> get!(123)
      %ArchiveSelector{}

      iex> get!(456)
      ** (Ecto.NoResultsError)

  """
  def get!(id), do: Repo.get!(ArchiveSelector, id)

  @doc """
  Creates a archive_selector.

  ## Examples

      iex> create(%{field: value})
      {:ok, %ArchiveSelector{}}

      iex> create(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create(attrs \\ %{}) do
    %ArchiveSelector{}
    |> ArchiveSelector.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a archive_selector.

  ## Examples

      iex> update(archive_selector, %{field: new_value})
      {:ok, %ArchiveSelector{}}

      iex> update(archive_selector, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update(%ArchiveSelector{} = archive_selector, attrs) do
    archive_selector
    |> ArchiveSelector.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ArchiveSelector.

  ## Examples

      iex> delete(archive_selector)
      {:ok, %ArchiveSelector{}}

      iex> delete(archive_selector)
      {:error, %Ecto.Changeset{}}

  """
  def delete(%ArchiveSelector{} = archive_selector) do
    Repo.delete(archive_selector)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking archive_selector changes.

  ## Examples

      iex> change(archive_selector)
      %Ecto.Changeset{source: %ArchiveSelector{}}

  """
  def change(%ArchiveSelector{} = archive_selector) do
    ArchiveSelector.changeset(archive_selector, %{})
  end
end