defmodule SportsPredictors.Stadiums.Stadium do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stadiums" do
    field :latitude, :float
    field :longitude, :float
    field :name, :string
    field :timezone, :string

    timestamps()
  end

  @doc false
  def changeset(stadium, attrs) do
    stadium
    |> cast(attrs, [:name, :latitude, :longitude, :timezone])
    |> validate_required([:name, :latitude, :longitude, :timezone])
  end
end
