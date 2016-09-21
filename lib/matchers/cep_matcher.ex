defmodule XBacon.Matchers.CEP do
  @moduledoc """
  Defines matchers for CEP address information, the brazilian ZIP code
  """

  @cep_pattern ~r/([0-9]{5}[-]?[0-9]{3})/s

  @doc """
  Validates the given `value` using the CEP pattern,
  it checks for the following formats:

    - `xxxxxx-xxx`
    - `xxxxxxxxx`

  Retuns `true` if the value matches any of the formats,
  otherwise, `false`.
  """
  def valid?(value) do
    Regex.match?(@cep_pattern, value || "")
  end

end
