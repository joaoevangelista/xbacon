defmodule XBacon.Changeset.CNPJTest do
  use ExUnit.Case

  alias XBacon.Stub.Person
  alias XBacon.Changeset.CNPJ

  @valid_cnpj "35.246.785/0001-61"
  @invalid_cnpj "61.968.61/0001-31"

  test "valid cnpj's do not add a validation error on changeset" do
    changeset = Person.changeset(%Person{}, %{cnpj: @valid_cnpj}) |> CNPJ.validate_cnpj
    assert changeset.valid?
  end

  test "invalid cnpj get caught into validation on changeset" do
    changeset = Person.changeset(%Person{}, %{cnpj: @invalid_cnpj}) |> CNPJ.validate_cnpj
    [cnpj: {message, _}] = changeset.errors
    assert message == "CNPJ has invalid format."
    refute changeset.valid?
  end
end
