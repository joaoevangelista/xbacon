defmodule XBaconTest.Changeset.CPF do
  use ExUnit.Case
  doctest XBacon

  alias XBacon.Changeset.CPF
  alias XBacon.Stub.Person

  @valid_cpf "403.878.725-74"
  @no_dots_cpf "403878725-74"
  @invalid_cpf "534523512"
  @invalid_verifier_cpf "403.878.725-76"

  test "person using a valid cpf should not get an error about it being invalid" do
    changeset = Person.changeset(%Person{}, %{cpf: @valid_cpf}) |> CPF.validate_cpf
    assert changeset.valid?
  end

  test "person with a cpf without dots but on the right format should not be invalid" do
    changeset = Person.changeset(%Person{}, %{cpf: @no_dots_cpf}) |> CPF.validate_cpf
    assert changeset.valid?
  end

  test "person with invalid cpf should receive an error about it" do
    changeset = Person.changeset(%Person{}, %{cpf: @invalid_cpf}) |> CPF.validate_cpf
    [cpf: {message, _}] = changeset.errors
    assert message == "CPF has invalid format."
    refute changeset.valid?

  end

  test "person with missing cpf should receive an error about it" do
    changeset = Person.changeset(%Person{}, %{}) |> CPF.validate_cpf
    [cpf: {message, _}] = changeset.errors
    assert message == "CPF has invalid format."
    refute changeset.valid?
  end

  test "person with valid should pass the validation of it's digits" do
    changeset = Person.changeset(%Person{}, %{cpf: @valid_cpf}) |> CPF.validate_strictly_cpf
    assert changeset.valid?
  end

  test "person with invalid verification digits must not be acceptable for strictly validation" do
    changeset = Person.changeset(%Person{}, %{cpf: @invalid_verifier_cpf}) |> CPF.validate_strictly_cpf
    refute changeset.valid?
  end

end
