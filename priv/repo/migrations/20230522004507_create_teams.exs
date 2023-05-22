defmodule SportsPredictors.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string
      add :current_elo, :float
      add :home_color, :string
      add :away_color, :string
      add :stadium_id, references(:stadiums, on_delete: :nothing)
      add :division_id, references(:divisions, on_delete: :nothing)

      timestamps()
    end

    create index(:teams, [:stadium_id])
    create index(:teams, [:division_id])
  end
end
