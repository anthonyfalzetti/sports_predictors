defmodule SportsPredictors.Repo.Migrations.CreateSeasons do
  use Ecto.Migration

  def change do
    create table(:seasons) do
      add :year, :integer

      timestamps()
    end
  end
end
