defmodule SportsPredictors.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset
  alias SportsPredictors.Stadiums.Stadium
  alias SportsPredictors.Divisions.Division

  schema "teams" do
    field(:away_color, :string)
    field(:current_elo, :float)
    field(:home_color, :string)
    field(:name, :string)
    belongs_to(:stadium, Stadium)
    belongs_to(:division, Division)

    timestamps()
  end

  @required_fields ~w(name current_elo home_color away_color)a
  @optional_fields ~w()a

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
