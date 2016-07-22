defmodule SessionService.Session do
  use SessionService.Web, :model

  schema "sessions" do
    field :uuid, :integer
    has_many :credentials, SessionService.Credential

    timestamps()
  end

  @required_fields ~w(uuid)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_required([:uuid])
    |> unique_constraint(:uuid)
  end
end
