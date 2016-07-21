defmodule SessionService.Repo.Migrations.CreateSession do
  use Ecto.Migration

  def change do
    create table(:sessions) do
      add :uuid, :integer

      timestamps()
    end

    create unique_index(:sessions, [:uuid])
  end
end
