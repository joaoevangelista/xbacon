defmodule XBacon.Matchers.CNPJTest do
  use ExUnit.Case
  doctest XBacon

  alias XBacon.Matchers.CNPJ


  @valid_cnpj "35.246.785/0001-61"
  @invalid_cnpjs ["61.968.61/0001-31", "61.968.06100001-31", "619680000131"]
  @no_dots_cnpj "346546530001-06"
  @plain_cnpj "51635079000168"

  test "a valid cnpj should also be validated by matcher" do
    assert CNPJ.valid? @valid_cnpj
  end

  test "missing formats and wrong number of digits are invalid" do
    valids = Enum.filter(@invalid_cnpjs, &CNPJ.valid?/1)
    assert Enum.empty?(valids)
  end

  test "even cnpj without dots are acceptable if they have the required length" do
    assert CNPJ.valid? @no_dots_cnpj
  end

  test "plain cnpj is also valid" do
    assert CNPJ.valid? @plain_cnpj
  end

  test "nil values are not valid either do not crash" do
    refute CNPJ.valid? nil
  end
end
