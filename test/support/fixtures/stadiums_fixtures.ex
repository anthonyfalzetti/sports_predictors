defmodule SportsPredictors.StadiumsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SportsPredictors.Stadiums` context.
  """

  @doc """
  Generate a stadium.
  """
  def stadium_fixture(attrs \\ %{}) do
    {:ok, stadium} =
      attrs
      |> Enum.into(%{
        latitude: 120.5,
        longitude: 120.5,
        name: "some name",
        timezone: "some timezone"
      })
      |> SportsPredictors.Stadiums.create_stadium()

    stadium
  end
end
