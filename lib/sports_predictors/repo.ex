defmodule SportsPredictors.Repo do
  use Ecto.Repo,
    otp_app: :sports_predictors,
    adapter: Ecto.Adapters.Postgres
end
