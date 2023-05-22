defmodule SportsPredictors.Stadiums.Stadium do
  use Ecto.Schema
  import Ecto.Changeset
  alias SportsPredictors.Teams.Team

  schema "stadiums" do
    field(:latitude, :float)
    field(:longitude, :float)
    field(:name, :string)
    field(:timezone, :string)
    has_many(:team, Team)

    timestamps()
  end

  @required_fields ~w(name latitude longitude timezone)a

  @doc false
  def changeset(stadium, attrs) do
    stadium
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
