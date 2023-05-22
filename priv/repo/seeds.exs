# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SportsPredictors.Repo.insert!(%SportsPredictors.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule SportsPredictors.Seeds do
  import SportsPredictors.Seeds.Helper
  alias SportsPredictors.Stadiums
  alias SportsPredictors.Stadiums.Stadium
  alias SportsPredictors.Conferences.Conference
  alias SportsPredictors.Divisions.Division
  alias SportsPredictors.Repo

  def seed_all!() do
    seed_user!()
    seed_stadiums!()
    seed_conferences!()
    seed_divisions!()
  end

  defp seed_user!() do
    %{
      email: "anthony.falzetti@gmail.com",
      password: "P@ssw0rd!"
    }
    |> SportsPredictors.Accounts.register_user()
  end

  defp seed_stadiums!() do
    if empty?(Stadium) do
      load_up_csv("../../../support/stadiums.csv")
      |> Enum.reduce([], fn {:ok, row}, acc ->
        record = %{
          name: row["stadium_name"],
          latitude: parse_float(row["LATITUDE"]),
          longitude: parse_float(row["LONGITUDE"])
        }

        [record | acc]
      end)
      |> Enum.dedup()
      |> Enum.each(fn stadium ->
        Stadiums.create_stadium(stadium)
      end)
    end
  end

  defp seed_conferences!() do
    if empty?(Conference) do
      [
        %{name: "afc"},
        %{name: "nfc"}
      ]
      |> Enum.each(fn conference ->
        SportsPredictors.Conferences.create_conference(conference)
      end)
    end
  end

  defp seed_divisions!() do
    if empty?(Division) do
      Conference
      |> Repo.all()
      |> Enum.map(fn conference ->
        [
          %{name: "east", conference_id: conference.id},
          %{name: "north", conference_id: conference.id},
          %{name: "south", conference_id: conference.id},
          %{name: "west", conference_id: conference.id}
        ]
        |> Enum.each(fn division ->
          SportsPredictors.Divisions.create_division(division)
        end)
      end)
    end
  end
end

SportsPredictors.Seeds.seed_all!()
