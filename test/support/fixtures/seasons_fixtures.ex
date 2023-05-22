defmodule SportsPredictors.SeasonsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SportsPredictors.Seasons` context.
  """

  @doc """
  Generate a season.
  """
  def season_fixture(attrs \\ %{}) do
    {:ok, season} =
      attrs
      |> Enum.into(%{
        year: 42
      })
      |> SportsPredictors.Seasons.create_season()

    season
  end
end
