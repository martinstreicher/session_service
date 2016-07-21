defmodule SessionService.Repo.Migrations.CreateCredentials do
  use Ecto.Migration

  def change do
    create table(:credentials) do
      add :user_id, :string, null: false
      add :type, :string

      timestamps
    end

    create unique_index(:credentials, [:user_id])
  end
end
