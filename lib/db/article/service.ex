defmodule Db.Article.Service do
  import Ecto.Query, warn: false

  alias Db.Repo
  alias Db.Article

  @doc """
  Returns the list of articles.

  ## Examples

      iex> lists()
      [%Article{}, ...]

  """
  def lists(site_ids, till \\ DateTime.utc_now(), limit \\ 20) do
    sites = convert_to_list(site_ids)

    Repo.all from a in Article,
      where: a.site_id in ^sites,
      #where: a.category_id in ^category_ids,
      where: a.published_at < ^till,
      limit: ^limit,
      order_by: [desc: a.published_at],
      preload: :site
  end

  defp convert_to_list(nil), do: []
  defp convert_to_list(value) when is_list(value), do: value
  defp convert_to_list(value), do: [value]

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
  def update(attrs, %Article{} = article) do
    non_empty_attrs = %{
      author: article.author || attrs.author,
      published_at: article.published_at || attrs.published_at,
      category: article.category || attrs.category,
      content: attrs.content,
      html: attrs.html
    }

    article
    |> Article.changeset(non_empty_attrs)
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
