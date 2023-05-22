defmodule SportsPredictors.WeeksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SportsPredictors.Weeks` context.
  """

  @doc """
  Generate a week.
  """
  def week_fixture(attrs \\ %{}) do
    {:ok, week} =
      attrs
      |> Enum.into(%{
        number: 42
      })
      |> SportsPredictors.Weeks.create_week()

    week
  end
end
