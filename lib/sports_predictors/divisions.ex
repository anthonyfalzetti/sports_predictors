defmodule SportsPredictors.Divisions do
  @moduledoc """
  The Divisions context.
  """

  import Ecto.Query, warn: false
  alias SportsPredictors.Repo

  alias SportsPredictors.Divisions.Division
  alias SportsPredictors.Conferences.Conference

  @doc """
  Returns the list of divisions.

  ## Examples

      iex> list_divisions()
      [%Division{}, ...]

  """
  def list_divisions do
    Repo.all(Division)
  end

  @doc """
  Gets a single division.

  Raises `Ecto.NoResultsError` if the Division does not exist.

  ## Examples

      iex> get_division!(123)
      %Division{}

      iex> get_division!(456)
      ** (Ecto.NoResultsError)

  """
  def get_division!(id), do: Repo.get!(Division, id)

  def get_stadium_by_conference_and_division_name!(conference_name, division_name) do
    Division
    |> join(:inner, [d], c in Conference, on: d.conference_id == c.id)
    |> where([d, c], d.name == ^division_name)
    |> where([d, c], c.name == ^conference_name)
    |> limit(1)
    |> Repo.one!()
  end

  @doc """
  Creates a division.

  ## Examples

      iex> create_division(%{field: value})
      {:ok, %Division{}}

      iex> create_division(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_division(attrs \\ %{}) do
    %Division{}
    |> Division.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a division.

  ## Examples

      iex> update_division(division, %{field: new_value})
      {:ok, %Division{}}

      iex> update_division(division, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_division(%Division{} = division, attrs) do
    division
    |> Division.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a division.

  ## Examples

      iex> delete_division(division)
      {:ok, %Division{}}

      iex> delete_division(division)
      {:error, %Ecto.Changeset{}}

  """
  def delete_division(%Division{} = division) do
    Repo.delete(division)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking division changes.

  ## Examples

      iex> change_division(division)
      %Ecto.Changeset{data: %Division{}}

  """
  def change_division(%Division{} = division, attrs \\ %{}) do
    Division.changeset(division, attrs)
  end
end
