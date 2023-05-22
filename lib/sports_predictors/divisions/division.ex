defmodule SportsPredictors.Divisions.Division do
  use Ecto.Schema
  import Ecto.Changeset
  alias SportsPredictors.Conferences.Conference
  alias SportsPredictors.Teams.Team

  schema "divisions" do
    field(:name, :string)
    belongs_to(:conference, Conference)
    has_many(:team, Team)

    timestamps()
  end

  @required_fields ~w(name conference_id)a

  @doc false
  def changeset(division, attrs) do
    division
    |> cast(attrs, @required_fields)
    |> unique_constraint([:conference_id, :name])
    |> validate_required(@required_fields)
  end
end
