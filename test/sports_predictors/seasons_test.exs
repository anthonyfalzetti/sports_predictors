defmodule SportsPredictors.SeasonsTest do
  use SportsPredictors.DataCase

  alias SportsPredictors.Seasons

  describe "seasons" do
    alias SportsPredictors.Seasons.Season

    import SportsPredictors.SeasonsFixtures

    @invalid_attrs %{year: nil}

    test "list_seasons/0 returns all seasons" do
      season = season_fixture()
      assert Seasons.list_seasons() == [season]
    end

    test "get_season!/1 returns the season with given id" do
      season = season_fixture()
      assert Seasons.get_season!(season.id) == season
    end

    test "create_season/1 with valid data creates a season" do
      valid_attrs = %{year: 42}

      assert {:ok, %Season{} = season} = Seasons.create_season(valid_attrs)
      assert season.year == 42
    end

    test "create_season/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Seasons.create_season(@invalid_attrs)
    end

    test "update_season/2 with valid data updates the season" do
      season = season_fixture()
      update_attrs = %{year: 43}

      assert {:ok, %Season{} = season} = Seasons.update_season(season, update_attrs)
      assert season.year == 43
    end

    test "update_season/2 with invalid data returns error changeset" do
      season = season_fixture()
      assert {:error, %Ecto.Changeset{}} = Seasons.update_season(season, @invalid_attrs)
      assert season == Seasons.get_season!(season.id)
    end

    test "delete_season/1 deletes the season" do
      season = season_fixture()
      assert {:ok, %Season{}} = Seasons.delete_season(season)
      assert_raise Ecto.NoResultsError, fn -> Seasons.get_season!(season.id) end
    end

    test "change_season/1 returns a season changeset" do
      season = season_fixture()
      assert %Ecto.Changeset{} = Seasons.change_season(season)
    end
  end
end
