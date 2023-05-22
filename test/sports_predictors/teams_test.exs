defmodule SportsPredictors.TeamsTest do
  use SportsPredictors.DataCase

  alias SportsPredictors.Teams

  describe "teams" do
    alias SportsPredictors.Teams.Team

    import SportsPredictors.TeamsFixtures

    @invalid_attrs %{away_color: nil, current_elo: nil, home_color: nil, name: nil}

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Teams.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Teams.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      valid_attrs = %{away_color: "some away_color", current_elo: 120.5, home_color: "some home_color", name: "some name"}

      assert {:ok, %Team{} = team} = Teams.create_team(valid_attrs)
      assert team.away_color == "some away_color"
      assert team.current_elo == 120.5
      assert team.home_color == "some home_color"
      assert team.name == "some name"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Teams.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      update_attrs = %{away_color: "some updated away_color", current_elo: 456.7, home_color: "some updated home_color", name: "some updated name"}

      assert {:ok, %Team{} = team} = Teams.update_team(team, update_attrs)
      assert team.away_color == "some updated away_color"
      assert team.current_elo == 456.7
      assert team.home_color == "some updated home_color"
      assert team.name == "some updated name"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Teams.update_team(team, @invalid_attrs)
      assert team == Teams.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Teams.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Teams.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Teams.change_team(team)
    end
  end
end
