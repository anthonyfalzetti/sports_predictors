defmodule SportsPredictors.Seeds.Helper do
  # use Timex

  alias SportsPredictors.Repo

  def parse_boolean("1"), do: true
  def parse_boolean("0"), do: false
  def parse_boolean("true"), do: true
  def parse_boolean("True"), do: true
  def parse_boolean(_), do: false

  # def parse_date(%{"Date" => date, "Year" => year}) do
  #   {month, day} = String.split_at(date, -2)

  #   Timex.parse!("#{year}-#{month}-#{day}", "{YYYY}-{M}-{0D}")
  #   |> NaiveDateTime.to_date()
  # end

  # def parse_date(date) do
  #   date
  #   |> Timex.parse!("{M}/{D}/{YYYY}")
  #   |> NaiveDateTime.to_date()
  # end

  def parse_iso_date(%{"date" => date}), do: Date.from_iso8601!(date)

  def parse_integer(""), do: nil

  def parse_integer(string) do
    string
    |> Integer.parse()
    |> elem(0)
  end

  def parse_float(""), do: nil

  def parse_float(string) do
    string
    |> Float.parse()
    |> elem(0)
  end

  def empty?(module) do
    module
    |> Repo.all()
    |> Enum.empty?()
  end

  def parse_team("GreenBay"), do: "GB"
  def parse_team("Chicago"), do: "CHI"
  def parse_team("Atlanta"), do: "ATL"
  def parse_team("Minnesota"), do: "MIN"
  def parse_team("Washington"), do: "WSH"
  def parse_team("Philadelphia"), do: "PHI"
  def parse_team("Buffalo"), do: "BUF"
  def parse_team("BuffaloBills"), do: "BUF"
  def parse_team("NYJets"), do: "NYJ"
  def parse_team("Baltimore"), do: "BAL"
  def parse_team("Miami"), do: "MIA"
  def parse_team("SanFrancisco"), do: "SF"
  def parse_team("TampaBay"), do: "TB"
  def parse_team("KansasCity"), do: "KC"
  def parse_team("Jacksonville"), do: "JAX"
  def parse_team("Tennessee"), do: "TEN"
  def parse_team("Cleveland"), do: "CLE"
  def parse_team("LosAngeles"), do: "LAR"
  def parse_team("LARams"), do: "LAR"
  def parse_team("St.Louis"), do: "LAR"
  def parse_team("Carolina"), do: "CAR"
  def parse_team("Detroit"), do: "DET"
  def parse_team("Arizona"), do: "ARI"
  def parse_team("Cincinnati"), do: "CIN"
  def parse_team("Seattle"), do: "SEA"
  def parse_team("Indianapolis"), do: "IND"
  def parse_team("LAChargers"), do: "LAC"
  def parse_team("SanDiego"), do: "LAC"
  def parse_team("NYGiants"), do: "NYG"
  def parse_team("NewYork"), do: "NYG"
  def parse_team("Dallas"), do: "DAL"
  def parse_team("Pittsburgh"), do: "PIT"
  def parse_team("NewEngland"), do: "NE"
  def parse_team("Houston"), do: "HOU"
  def parse_team("HoustonTexans"), do: "HOU"
  def parse_team("NewOrleans"), do: "NO"
  def parse_team("Denver"), do: "DEN"
  def parse_team("Oakland"), do: "OAK"

  def load_up_csv(filepath) do
    filepath
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> CSV.decode(headers: true)
  end
end
