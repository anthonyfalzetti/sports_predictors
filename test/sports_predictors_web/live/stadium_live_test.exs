defmodule SportsPredictorsWeb.StadiumLiveTest do
  use SportsPredictorsWeb.ConnCase

  import Phoenix.LiveViewTest
  import SportsPredictors.StadiumsFixtures

  @create_attrs %{latitude: 120.5, longitude: 120.5, name: "some name", timezone: "some timezone"}
  @update_attrs %{
    latitude: 456.7,
    longitude: 456.7,
    name: "some updated name",
    timezone: "some updated timezone"
  }
  @invalid_attrs %{latitude: nil, longitude: nil, name: nil, timezone: nil}

  defp create_stadium(_) do
    stadium = stadium_fixture()
    %{stadium: stadium}
  end

  describe "Index" do
    setup [:create_stadium, :register_and_log_in_user]

    test "lists all stadiums", %{conn: conn, stadium: stadium} do
      {:ok, _index_live, html} = live(conn, ~p"/stadiums")

      assert html =~ "Listing Stadiums"
      assert html =~ stadium.name
    end

    test "saves new stadium", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/stadiums")

      assert index_live |> element("a", "New Stadium") |> render_click() =~
               "New Stadium"

      assert_patch(index_live, ~p"/stadiums/new")

      assert index_live
             |> form("#stadium-form", stadium: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#stadium-form", stadium: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/stadiums")

      html = render(index_live)
      assert html =~ "Stadium created successfully"
      assert html =~ "some name"
    end

    test "updates stadium in listing", %{conn: conn, stadium: stadium} do
      {:ok, index_live, _html} = live(conn, ~p"/stadiums")

      assert index_live |> element("#stadiums-#{stadium.id} a", "Edit") |> render_click() =~
               "Edit Stadium"

      assert_patch(index_live, ~p"/stadiums/#{stadium}/edit")

      assert index_live
             |> form("#stadium-form", stadium: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#stadium-form", stadium: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/stadiums")

      html = render(index_live)
      assert html =~ "Stadium updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes stadium in listing", %{conn: conn, stadium: stadium} do
      {:ok, index_live, _html} = live(conn, ~p"/stadiums")

      assert index_live |> element("#stadiums-#{stadium.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#stadiums-#{stadium.id}")
    end
  end

  describe "Show" do
    setup [:create_stadium, :register_and_log_in_user]

    test "displays stadium", %{conn: conn, stadium: stadium} do
      {:ok, _show_live, html} = live(conn, ~p"/stadiums/#{stadium}")

      assert html =~ "Show Stadium"
      assert html =~ stadium.name
    end

    test "updates stadium within modal", %{conn: conn, stadium: stadium} do
      {:ok, show_live, _html} = live(conn, ~p"/stadiums/#{stadium}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Stadium"

      assert_patch(show_live, ~p"/stadiums/#{stadium}/show/edit")

      assert show_live
             |> form("#stadium-form", stadium: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#stadium-form", stadium: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/stadiums/#{stadium}")

      html = render(show_live)
      assert html =~ "Stadium updated successfully"
      assert html =~ "some updated name"
    end
  end
end
