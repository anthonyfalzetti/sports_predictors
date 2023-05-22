defmodule SportsPredictors.Seasons.Season do
  use Ecto.Schema
  import Ecto.Changeset
  alias SportsPredictors.Weeks.Week

  schema "seasons" do
    field(:year, :integer)
    has_many(:week, Week)

    timestamps()
  end

  @required_fields ~w(year)a

  @doc false
  def changeset(season, attrs) do
    season
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
