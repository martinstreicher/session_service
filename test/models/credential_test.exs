defmodule SessionService.CredentialTest do
  use SessionService.ModelCase

  alias SessionService.Credential

  @valid_attrs %{type: "some content", user_id: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Credential.changeset(%Credential{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Credential.changeset(%Credential{}, @invalid_attrs)
    refute changeset.valid?
  end
end
