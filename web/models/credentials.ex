defmodule SessionService.Credentials do
  use SessionService.Web, :model

  schema "credentials" do
    field :user_id, :string
    field :type, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:type, :user_id])
    |> validate_required([:type, :user_id])
    |> unique_constraint(:user_id)
  end
end
