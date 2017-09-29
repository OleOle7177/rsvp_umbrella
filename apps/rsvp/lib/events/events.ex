defmodule Rsvp.Events do

  # change2 = Rsvp.Events.changeset(%Rsvp.Events{}, %{title: "Test", date: "2018-01-01 00:00:00", location: "Loc1"})
  # Rsvp.Repo.insert(change2)
  # Rsvp.EventQueries.create(Rsvp.Events.changeset(%Rsvp.Events{}, %{title: "Test"}))
  use Ecto.Schema

  import Ecto.Changeset

  schema "events" do
    field :title, :string
    field :location, :string
    field :date, :naive_datetime
    field :description, :string

    timestamps()
  end

  @required_fields ~w(title location date)a #массив атомов
  @optional_fields ~w(description)a

  def changeset(event, params \\ %{}) do
    event
      |> cast(params, @required_fields ++ @optional_fields)
      |> validate_required(@required_fields)
      |> validate_change(:date, &must_be_future/2)
      |> unique_constraint(:title)
  end

  defp must_be_future(_, value) do
    Ecto.DateTime.compare(to_ecto_datetime(value), Ecto.DateTime.utc)
      |> get_error
  end

  defp get_error(comparison) when comparison == :lt, do: [date: "Cannot be in the past"]
  defp get_error(_), do: []

  defp to_ecto_datetime(value), do: value |> NaiveDateTime.to_erl |> Ecto.DateTime.from_erl
end
