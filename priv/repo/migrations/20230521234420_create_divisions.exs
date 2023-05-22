defmodule SportsPredictors.Repo.Migrations.CreateDivisions do
  use Ecto.Migration

  def change do
    create table(:divisions) do
      add :name, :string
      add :conference_id, references(:conferences, on_delete: :nothing)

      timestamps()
    end

    create index(:divisions, [:conference_id])
  end
end
