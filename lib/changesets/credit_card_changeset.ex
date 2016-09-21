defmodule XBacon.Changeset.CreditCard do
  import Ecto.Changeset
  import XBacon.Matchers.CreditCard

  @moduledoc """
  Defines a set of validations that can be applied on a changeset using the
  `XBacon.Matchers.CreditCard` matchers.
  """

  @doc """
  Validates the given changeset looking for the `cc_number` field,
  it allows customization of lookup field and error messages.

  ## Example

      struct
      |> cast(params, @fields)
      |> validate_cc_number

  It will look up for a field named :cc_number to acquire the value, if you
  do not use this name on field you can customize as second arity.
  To use a customized error message, you can pass a keyword list with
  message key set.

  ## Example

       struct
       |> cast(params, @fields)
       |> validate_cc_number(:payment_cc_number, message: "Your number is not valid.")


  """
  def validate_cc_number(changeset, field \\ :cc_number, opts \\ []) do
    number = get_field(changeset, field)
    case valid? number do
      true -> changeset
      false -> add_error(changeset, field,
       Keyword.get(opts, :message, "Credit card number has invalid format."))
    end
  end
end
