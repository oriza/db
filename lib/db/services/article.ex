defmodule Db.Service.Article do
  import Ecto.Query, warn: false
  
  alias Db.Repo
  alias Db.Schema.Article

  @doc """
  Returns the list of articles.

  ## Examples

      iex> lists()
      [%Article{}, ...]

  """
  def lists(site_ids, category_ids, limit \\ 20, offset \\ 1) do
    Repo.all from a in Article,
      where: a.site_id in ^site_ids,
      where: a.category_id in ^category_ids,
      limit: ^limit,
      offset: ^offset,
      order_by: [desc: a.published_at]
  end

  @doc """
  Returns the number of articles.

  ## Examples

      iex> count()
      1

  """
  def count do
    Repo.one(from a in "articles", select: count(a.id))
  end

  @doc """
  Gets a single article.

  Raises `Ecto.NoResultsError` if the Article does not exist.

  ## Examples

      iex> get!(123)
      %Article{}

      iex> get!(456)
      ** (Ecto.NoResultsError)

  """
  def get!(id), do: Repo.get!(Article, id)

  @doc """
  Creates a article.

  ## Examples

      iex> create(%{field: value})
      {:ok, %Article{}}

      iex> create(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create(attrs \\ %{}) do
    %Article{}
    |> Article.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a article.

  ## Examples

      iex> update(article, %{field: new_value})
      {:ok, %Article{}}

      iex> update(article, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update(%Article{} = article, attrs) do
    
    article
    |> Article.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Article.

  ## Examples

      iex> delete(article)
      {:ok, %Article{}}

      iex> delete(article)
      {:error, %Ecto.Changeset{}}

  """
  def delete(%Article{} = article) do
    Repo.delete(article)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking article changes.

  ## Examples

      iex> change(article)
      %Ecto.Changeset{source: %Article{}}

  """
  def change(%Article{} = article) do
    Article.changeset(article, %{})
  end
end