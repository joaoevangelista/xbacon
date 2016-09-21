defmodule XBacon.Matchers.CEPTest do
  use ExUnit.Case
  alias XBacon.Matchers.CEP

  @valid_cep "12345-678"
  @invalid_cep "12312"
  @plain_cep "12345678"

  test "valid ceps should match the defined pattern" do
    assert CEP.valid? @valid_cep
  end

  test "invalid cep should not match the defined pattern" do
    refute CEP.valid? @invalid_cep
  end

  test "plain cep should also match the defined pattern" do
    assert CEP.valid? @plain_cep
  end
end
