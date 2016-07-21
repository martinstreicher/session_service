defmodule SessionService.Credential do
  use SessionService.Web, :model

  schema "credentials" do
    field :user_id, :string
    field :type, :string
    belongs_to :session, SessionService.Session

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :type])
    |> validate_required([:user_id, :type])
    |> unique_constraint(:user_id)
  end
end
