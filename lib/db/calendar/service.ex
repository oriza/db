defmodule Db.Calendar.Service do
  import Ecto.Query, warn: false
  use Timex

  alias Db.Repo
  alias Db.Calendar

  def get!(date), do: Repo.get_by!(Calendar, date: date)

  def today!() do
    now = Timex.now("Europe/Budapest")

    get!("#{format_day(now.month)}/#{format_day(now.day)}")
  end

  def create(attrs \\ %{}) do
    %Calendar{}
    |> Calendar.changeset(attrs)
    |> Repo.insert()
  end

  def change(%Calendar{} = calendar) do
    Calendar.changeset(calendar, %{})
  end

  defp format_day(1), do: "01"
  defp format_day(2), do: "02"
  defp format_day(3), do: "03"
  defp format_day(4), do: "04"
  defp format_day(5), do: "05"
  defp format_day(6), do: "06"
  defp format_day(7), do: "07"
  defp format_day(8), do: "08"
  defp format_day(9), do: "09"
  defp format_day(num), do: Integer.to_string(num)
end
