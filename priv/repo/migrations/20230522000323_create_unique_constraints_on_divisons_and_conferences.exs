defmodule SportsPredictors.Repo.Migrations.CreateUniqueConstraintsOnDivisonsAndConferences do
  use Ecto.Migration

  def change do
    create(unique_index(:conferences, [:name]))
    create(unique_index(:divisions, [:conference_id, :name]))
  end
end
