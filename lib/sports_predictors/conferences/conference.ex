defmodule SportsPredictors.Conferences.Conference do
  use Ecto.Schema
  import Ecto.Changeset
  alias SportsPredictors.Divisions.Division

  schema "conferences" do
    field(:name, :string)
    has_many(:division, Division)

    timestamps()
  end

  @required_fields ~w(name)a

  @doc false
  def changeset(conference, attrs) do
    conference
    |> cast(attrs, @required_fields)
    |> unique_constraint(:name)
    |> validate_required(@required_fields)
  end
end
