defmodule XBacon.Matchers.EmailTest do
  use ExUnit.Case

  alias XBacon.Matchers.Email

  @valid_email "j_p123@gmail.com"
  @invalid_email "123!j@gmail.com"
  @incomplete_email "13_joao.com"
  @text_email "so my email is: #{@valid_email}, ok?"

  test "valid email should match the defined pattern on matcher" do
    assert Email.valid? @valid_email
  end

  test "invalid email should not match the defined pattern on matcher" do
    refute Email.valid? @invalid_email
  end

  test "incomplete email should not match the defined pattern on matcher" do
    refute Email.valid? @incomplete_email
  end

  test "Email around text should not match the defined pattern" do
    refute Email.valid? @text_email
  end
end
