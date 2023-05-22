defmodule SportsPredictors.Conferences.Conference do
  use Ecto.Schema
  import Ecto.Changeset
  alias SportsPredictors.Divisions.Division

  schema "conferences" do
    field(:name, :string)
    has_many(:division, Division)

    timestamps()
  end

  @doc false
  def changeset(conference, attrs) do
    conference
    |> cast(attrs, [:name])
    |> unique_constraint(:name)
    |> validate_required([:name])
  end
end
