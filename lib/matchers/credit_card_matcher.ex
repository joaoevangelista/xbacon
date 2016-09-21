defmodule XBacon.Matchers.CreditCard do
  @moduledoc """
  Defines matchers for verify credit card numbers values.
  """

  @cc_number_pattern ~r/([0-9]{4}[\s]?[0-9]{4}[\s]?[0-9]{4}[\s]?[0-9]{4})/

  @doc """
  Validates the given `value` of a credit card number, into
  the following formats:

    - `xxxx xxxx xxxx xxxx`
    - `xxxxxxxxxxxxxxxx`
  
  """
  def valid?(value) do
    Regex.match?(@cc_number_pattern, value || "")
  end

end
