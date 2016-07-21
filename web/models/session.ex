defmodule SessionService.Session do
  use SessionService.Web, :model

  schema "sessions" do
    field :uuid, :integer
    has_many :credentials, SessionService.Credential

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:uuid])
    |> validate_required([:uuid])
    |> unique_constraint(:uuid)
  end
end
