defmodule SportsPredictors.Weeks.Week do
  use Ecto.Schema
  import Ecto.Changeset

  alias SportsPredictors.Seasons.Season

  schema "weeks" do
    field(:number, :integer)
    belongs_to(:season, Season)

    timestamps()
  end

  @required_fields ~w(number)a

  @doc false
  def changeset(week, attrs) do
    week
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
