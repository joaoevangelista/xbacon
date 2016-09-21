defmodule XBacon.Changeset.EmailTest do
  use ExUnit.Case

  alias XBacon.Stub.Person
  alias XBacon.Changeset.Email

  @valid_email "j_p123@gmail.com"
  @invalid_email "123!j@gmail.com"

  test "valid emails should not raise an error on the changeset" do
    changeset = Person.changeset(%Person{}, %{email: @valid_email})
    |> Email.validate_email

    assert Enum.empty? changeset.errors
    assert changeset.valid?
  end

  test "invalid emails should raise error on the changeset" do
    changeset = Person.changeset(%Person{}, %{email: @invalid_email})
    |> Email.validate_email

    refute changeset.valid?
    refute Enum.empty? changeset.errors
    [email: {message, _}] = changeset.errors
    assert message == "Email has invalid format."
  end

end
