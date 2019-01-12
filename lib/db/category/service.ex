defmodule Db.Category.Service do
  import Ecto.Query, warn: false

  alias Db.Repo
  alias Db.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list()
      [%Category{}, ...]

  """
  def lists do
    Repo.all(Category)
  end

  @doc """
  Returns the number of categories.

  ## Examples

      iex> count()
      1

  """
  def count do
    Repo.one(from c in "categories", select: count(c.id))
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get!(123)
      %Category{}

      iex> get!(456)
      ** (Ecto.NoResultsError)

  """
  def get!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create(%{field: value})
      {:ok, %Category{}}

      iex> create(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Category.

  ## Examples

      iex> delete(category)
      {:ok, %Category{}}

      iex> delete(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change(category)
      %Ecto.Changeset{source: %Category{}}

  """
  def change(%Category{} = category) do
    Category.changeset(category, %{})
  end
end
