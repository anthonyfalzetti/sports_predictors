defmodule SportsPredictors.TeamsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SportsPredictors.Teams` context.
  """

  @doc """
  Generate a team.
  """
  def team_fixture(attrs \\ %{}) do
    {:ok, team} =
      attrs
      |> Enum.into(%{
        away_color: "some away_color",
        current_elo: 120.5,
        home_color: "some home_color",
        name: "some name"
      })
      |> SportsPredictors.Teams.create_team()

    team
  end
end
