defmodule SportsPredictors.Repo.Migrations.CreateStadiums do
  use Ecto.Migration

  def change do
    create table(:stadiums) do
      add :name, :string
      add :latitude, :float
      add :longitude, :float
      add :timezone, :string

      timestamps()
    end
  end
end
