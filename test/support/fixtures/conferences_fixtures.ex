defmodule SportsPredictors.ConferencesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SportsPredictors.Conferences` context.
  """

  @doc """
  Generate a conference.
  """
  def conference_fixture(attrs \\ %{}) do
    {:ok, conference} =
      attrs
      |> Enum.into(%{
        name: Faker.Team.name()
      })
      |> SportsPredictors.Conferences.create_conference()

    conference
  end
end
