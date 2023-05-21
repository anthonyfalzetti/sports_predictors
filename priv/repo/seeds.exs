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

  def seed_all!() do
    seed_stadiums!()
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
end

SportsPredictors.Seeds.seed_all!()
