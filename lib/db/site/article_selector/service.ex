defmodule Db.Site.ArticleSelector.Service do
  import Ecto.Query, warn: false

  alias Db.Repo
  alias Db.Site.ArticleSelector

  @doc """
  Returns the list of article_selectors.

  ## Examples

      iex> list()
      [%ArticleSelector{}, ...]

  """
  def lists do
    Repo.all(ArticleSelector)
  end

  @doc """
  Returns the number of article_selectors.

  ## Examples

      iex> count()
      1

  """
  def count do
    Repo.one(from c in "article_selectors", select: count(c.id))
  end

  @doc """
  Gets a single article_selector.

  Raises `Ecto.NoResultsError` if the ArticleSelector does not exist.

  ## Examples

      iex> get!(123)
      %ArticleSelector{}

      iex> get!(456)
      ** (Ecto.NoResultsError)

  """
  def get!(id), do: Repo.get!(ArticleSelector, id)

  @doc """
  Creates a article_selector.

  ## Examples

      iex> create(%{field: value})
      {:ok, %ArticleSelector{}}

      iex> create(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create(attrs \\ %{}) do
    %ArticleSelector{}
    |> ArticleSelector.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a article_selector.

  ## Examples

      iex> update(article_selector, %{field: new_value})
      {:ok, %ArticleSelector{}}

      iex> update(article_selector, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update(%ArticleSelector{} = article_selector, attrs) do
    article_selector
    |> ArticleSelector.changeset(attrs)
    |> Repo.update()
    |> IO.inspect
  end

  @doc """
  Deletes a ArticleSelector.

  ## Examples

      iex> delete(article_selector)
      {:ok, %ArticleSelector{}}

      iex> delete(article_selector)
      {:error, %Ecto.Changeset{}}

  """
  def delete(%ArticleSelector{} = article_selector) do
    Repo.delete(article_selector)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking article_selector changes.

  ## Examples

      iex> change(article_selector)
      %Ecto.Changeset{source: %ArticleSelector{}}

  """
  def change(%ArticleSelector{} = article_selector) do
    ArticleSelector.changeset(article_selector, %{})
  end
end
