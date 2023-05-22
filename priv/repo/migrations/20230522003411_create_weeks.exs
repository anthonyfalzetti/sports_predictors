defmodule SportsPredictors.Repo.Migrations.CreateWeeks do
  use Ecto.Migration

  def change do
    create table(:weeks) do
      add :number, :integer
      add :season_id, references(:seasons, on_delete: :nothing)

      timestamps()
    end

    create index(:weeks, [:season_id])
  end
end
