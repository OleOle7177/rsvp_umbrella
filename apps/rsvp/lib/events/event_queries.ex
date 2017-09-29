defmodule Rsvp.EventQueries do
  import Ecto.Query

  alias Rsvp.{Repo, Events} # alias for Repo and Events

  def any do
    Repo.one(from e in Events, select: count(e.id)) != 0
  end

  def get_all do
    # Repo - это модуль, отвечающий за коннект к бд.
    # all - метод, возвращающий все, что вернет query
    # from events Events - query
    Repo.all(from Events)
  end

  def get_all_for_location(location) do
    query = from e in Events,
      where: e.location == ^location # ^ передана внутрь аргументом, ^ - взять значение

      Repo.all(query)
  end

  def get_by_id(id) do
    # Rsvp.Repo.get!(Rsvp.Events, 10) get! - упадет если не будет звписи
    Repo.get(Events, id)
  end

  def create(event) do
    Repo.insert!(event)
  end
end

# insert to db: Rsvp.Repo.insert %Rsvp.Events{title: "Codefest", location: "The Office", date: Ecto.DateTime.cast!("2016-11-25 12:00:00")}
