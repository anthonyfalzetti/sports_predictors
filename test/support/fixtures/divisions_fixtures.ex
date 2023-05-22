defmodule SportsPredictors.DivisionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SportsPredictors.Divisions` context.
  """

  import SportsPredictors.ConferencesFixtures

  @doc """
  Generate a division.
  """
  def division_fixture(attrs \\ %{}) do
    {:ok, division} =
      attrs
      |> Enum.into(%{
        name: "some name",
        conference_id: conference_fixture().id
      })
      |> SportsPredictors.Divisions.create_division()

    division
  end
end
