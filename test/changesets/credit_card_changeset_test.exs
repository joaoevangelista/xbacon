defmodule XBacon.Changeset.CreditCardTest do
  use ExUnit.Case

  alias XBacon.Stub.Person
  alias XBacon.Changeset.CreditCard

  @valid_cc_number "6544 5555 5555 5555"
  @valid_plain_cc_number "6544555555555555"
  @invalid_cc_number "787 5566 6555 5555"
  @invalid_plain_cc_number "787556665555555"

  test "four sets of four number on a changeset should be treated as a valid format" do
    changeset = Person.changeset(%Person{}, %{cc_number: @valid_cc_number})
    |> CreditCard.validate_cc_number

    assert changeset.valid?
    assert Enum.empty?(changeset.errors)
  end

  test "sixteen numbers on a changeset should be treated as a valid format" do
    changeset = Person.changeset(%Person{}, %{cc_number: @valid_plain_cc_number})
    |> CreditCard.validate_cc_number

    assert changeset.valid?
    assert Enum.empty?(changeset.errors)
  end

  test "a missing number on any set of numbers that compounds a valid cc number should not be valid" do
    changeset = Person.changeset(%Person{}, %{cc_number: @invalid_cc_number})
    |> CreditCard.validate_cc_number

    refute changeset.valid?
    [cc_number: {message, _}] = changeset.errors
    assert message == "Credit card number has invalid format."
  end

  test "a custom message can be applied to the validate_cc_number fun" do
    changeset = Person.changeset(%Person{}, %{cc_number: @invalid_cc_number})
    |> CreditCard.validate_cc_number(:cc_number, message: "Your cc number is wrong.")

    refute changeset.valid?
    [cc_number: {message, _}] = changeset.errors
    assert message == "Your cc number is wrong."
  end
end
