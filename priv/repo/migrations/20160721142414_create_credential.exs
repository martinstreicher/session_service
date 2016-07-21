defmodule SessionService.Repo.Migrations.CreateCredential do
  use Ecto.Migration

  def change do
    create table(:credentials) do
      add :user_id, :string
      add :type, :string
      add :session_id, references(:sessions, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:credentials, [:session_id])
    create unique_index(:credentials, [:user_id])
  end
end
