defmodule SportsPredictors.WeeksTest do
  use SportsPredictors.DataCase

  alias SportsPredictors.Weeks

  describe "weeks" do
    alias SportsPredictors.Weeks.Week

    import SportsPredictors.WeeksFixtures

    @invalid_attrs %{number: nil}

    test "list_weeks/0 returns all weeks" do
      week = week_fixture()
      assert Weeks.list_weeks() == [week]
    end

    test "get_week!/1 returns the week with given id" do
      week = week_fixture()
      assert Weeks.get_week!(week.id) == week
    end

    test "create_week/1 with valid data creates a week" do
      valid_attrs = %{number: 42}

      assert {:ok, %Week{} = week} = Weeks.create_week(valid_attrs)
      assert week.number == 42
    end

    test "create_week/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Weeks.create_week(@invalid_attrs)
    end

    test "update_week/2 with valid data updates the week" do
      week = week_fixture()
      update_attrs = %{number: 43}

      assert {:ok, %Week{} = week} = Weeks.update_week(week, update_attrs)
      assert week.number == 43
    end

    test "update_week/2 with invalid data returns error changeset" do
      week = week_fixture()
      assert {:error, %Ecto.Changeset{}} = Weeks.update_week(week, @invalid_attrs)
      assert week == Weeks.get_week!(week.id)
    end

    test "delete_week/1 deletes the week" do
      week = week_fixture()
      assert {:ok, %Week{}} = Weeks.delete_week(week)
      assert_raise Ecto.NoResultsError, fn -> Weeks.get_week!(week.id) end
    end

    test "change_week/1 returns a week changeset" do
      week = week_fixture()
      assert %Ecto.Changeset{} = Weeks.change_week(week)
    end
  end
end
