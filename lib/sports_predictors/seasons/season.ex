defmodule SportsPredictors.Seasons.Season do
  use Ecto.Schema
  import Ecto.Changeset

  schema "seasons" do
    field :year, :integer

    timestamps()
  end

  @doc false
  def changeset(season, attrs) do
    season
    |> cast(attrs, [:year])
    |> validate_required([:year])
  end
end
