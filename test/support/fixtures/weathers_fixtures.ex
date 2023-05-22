defmodule SportsPredictors.WeathersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SportsPredictors.Weathers` context.
  """

  @doc """
  Generate a weather.
  """
  def weather_fixture(attrs \\ %{}) do
    {:ok, weather} =
      attrs
      |> Enum.into(%{
        precip_intensity: 120.5,
        precip_type: "some precip_type",
        temperature: 120.5,
        visibility: 120.5,
        wind_gust: 120.5,
        wind_speed: 120.5
      })
      |> SportsPredictors.Weathers.create_weather()

    weather
  end
end
