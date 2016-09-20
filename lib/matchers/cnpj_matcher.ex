defmodule XBacon.Matchers.CNPJ do
  @moduledoc """
  Defines matchers to verify cnpj values
  """

  @cnpj_pattern ~r/([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})/


  @doc """
  Validates the given `value` on the following formats:

    - `xx.xxx.xxx/xxxx-xx`
    - `xxxxxxxxxxxx-xx`
    - `xx.xxx.xxxxxxx-xx`
    - `xxxxxxxxxxxxxx`

    Returns `true` if the value is matched against valid patterns
    otherwise, `false`.
  """
  def valid?(value) do
    Regex.match?(@cnpj_pattern, value || "")
  end

end
