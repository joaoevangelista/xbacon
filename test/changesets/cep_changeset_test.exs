defmodule XBacon.Changeset.CEPTest do
  use ExUnit.Case

  alias XBacon.Stub.Person
  alias XBacon.Changeset.CEP

  @valid_cep "12345-678"
  @invalid_cep ["12312", "1351-324"]
  @plain_cep "12345678"

  test "valid cep should not add an error to the changeset" do
    changeset = Person.changeset(%Person{}, %{cep: @valid_cep})
    |> CEP.validate_cep

    assert changeset.valid?
    assert Enum.empty? changeset.errors
  end

  test "invalid cep should add an error to the changeset" do
    changeset = Person.changeset(%Person{}, %{cep: Enum.random(@invalid_cep)})
    |> CEP.validate_cep

    refute changeset.valid?
    refute Enum.empty? changeset.errors
    [cep: {message, _}] = changeset.errors
    assert message == "CEP has invalid format."
  end

  test "plain cep are also valid ones and should not add error to the changeset" do
    changeset = Person.changeset(%Person{}, %{cep: @plain_cep})
    |> CEP.validate_cep

    assert changeset.valid?
    assert Enum.empty? changeset.errors
  end

end
