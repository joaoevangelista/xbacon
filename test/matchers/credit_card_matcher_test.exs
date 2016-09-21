defmodule XBacon.Matchers.CreditCardTest do
  use ExUnit.Case

  alias XBacon.Matchers.CreditCard, as: CC

  @valid_cc_number "6544 5555 5555 5555"
  @valid_plain_cc_number "6544555555555555"
  @invalid_cc_number "787 5566 6555 5555"
  @invalid_plain_cc_number "787556665555555"

  test "four sets of four numbers should be treated as a valid format" do
    assert CC.valid? @valid_cc_number
    assert CC.valid? @valid_plain_cc_number
  end

  test "missing numbers should not be treated ass a valid format" do
    refute CC.valid? @invalid_cc_number
    refute CC.valid? @invalid_plain_cc_number
  end

end
