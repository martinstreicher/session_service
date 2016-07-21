defmodule SessionService.CredentialsTest do
  use SessionService.ModelCase, async: true
  alias SessionService.Credentials

  @valid_attrs %{user_id: "123456", type: "facebook"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Credentials.changeset(%Credentials{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Credentials.changeset(%Credentials{}, @invalid_attrs)
    refute changeset.valid?
  end
end
