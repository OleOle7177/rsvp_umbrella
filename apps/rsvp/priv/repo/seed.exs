unless Rsvp.EventQueries.any do
  Rsvp.EventQueries.create(Rsvp.Events.changeset(%Rsvp.Events{}, %{date: "2018-01-01 00:00:00",
    title: "Title1", location: "Some location"}))
  Rsvp.EventQueries.create(Rsvp.Events.changeset(%Rsvp.Events{}, %{date: "2019-01-01 00:00:00",
    title: "Title2", location: "Some another location"}))
end
