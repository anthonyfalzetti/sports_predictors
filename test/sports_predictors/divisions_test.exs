defmodule SportsPredictors.DivisionsTest do
  use SportsPredictors.DataCase

  alias SportsPredictors.Divisions

  describe "divisions" do
    alias SportsPredictors.Divisions.Division

    import SportsPredictors.DivisionsFixtures
    import SportsPredictors.ConferencesFixtures

    @invalid_attrs %{name: nil}

    test "list_divisions/0 returns all divisions" do
      division = division_fixture()
      assert Divisions.list_divisions() == [division]
    end

    test "get_division!/1 returns the division with given id" do
      division = division_fixture()
      assert Divisions.get_division!(division.id) == division
    end

    test "create_division/1 with valid data creates a division" do
      valid_attrs = %{name: "some name", conference_id: conference_fixture().id}

      assert {:ok, %Division{} = division} = Divisions.create_division(valid_attrs)
      assert division.name == "some name"
    end

    test "create_division/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Divisions.create_division(@invalid_attrs)
    end

    test "update_division/2 with valid data updates the division" do
      division = division_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Division{} = division} = Divisions.update_division(division, update_attrs)
      assert division.name == "some updated name"
    end

    test "update_division/2 with invalid data returns error changeset" do
      division = division_fixture()
      assert {:error, %Ecto.Changeset{}} = Divisions.update_division(division, @invalid_attrs)
      assert division == Divisions.get_division!(division.id)
    end

    test "delete_division/1 deletes the division" do
      division = division_fixture()
      assert {:ok, %Division{}} = Divisions.delete_division(division)
      assert_raise Ecto.NoResultsError, fn -> Divisions.get_division!(division.id) end
    end

    test "change_division/1 returns a division changeset" do
      division = division_fixture()
      assert %Ecto.Changeset{} = Divisions.change_division(division)
    end
  end
end
