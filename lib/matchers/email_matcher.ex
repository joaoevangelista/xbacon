defmodule XBacon.Matchers.Email do
  @moduledoc """
  Defines matchers for verify email values.
  """

  @email_pattern ~r/(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)/

  @doc """
  Validates the given email macthing the pattern defined on
  (RFC 5322)[http://www.ietf.org/rfc/rfc5322.txt].

  Returns `true` if the value match the pattern, otherwise, `false`.
  """
  def valid?(value) do
    Regex.match?(@email_pattern, value || "")
  end
end
