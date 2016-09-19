defmodule XBaconTest.Matchers.CPF do
  use ExUnit.Case
  doctest XBacon

  alias XBacon.Matchers.CPF

  @valid_cpf "403.878.725-74"
  @no_dots_cpf "403878725-74"
  @invalid_cpf "1234567890123"

  test "truly official cpf is valid" do
    assert CPF.valid? @valid_cpf
  end

  test "refute unmatched cpf" do
    refute CPF.valid? @invalid_cpf
  end

  test "accpet cpf without dots but with trace" do
    assert CPF.valid? @no_dots_cpf
  end

  test "strictly valid must be valid" do
    assert CPF.strictly_valid? @valid_cpf
  end

  test "strictly valid cpf can be without dots" do
    assert CPF.strictly_valid? @no_dots_cpf
  end

  test "invalid cpf is not strictly valid too" do
    refute CPF.strictly_valid? @invalid_cpf
  end

end
