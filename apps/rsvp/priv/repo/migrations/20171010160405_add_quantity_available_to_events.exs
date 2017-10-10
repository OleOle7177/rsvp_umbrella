defmodule Rsvp.Repo.Migrations.AddQuantityAvailableToEvents do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :quantity_available, :integer, default: 25
    end
  end
end
