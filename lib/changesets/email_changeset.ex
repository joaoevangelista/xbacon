defmodule XBacon.Changeset.Email do
  import Ecto.Changeset
  import XBacon.Matchers.Email

  @moduledoc """
  Defines a set of validations that can be applied on a changeset using the
  `XBacon.Matchers.Email` matchers.
  """

  @doc """
  Validates the given changeset looking for the `email` field,
  it allows customization of lookup field and error messages.

  ## Example

      struct
      |> cast(params, @fields)
      |> validate_email

  It will look up for a field named :email to acquire the value, if you
  do not use this name on field you can customize as second arity.
  To use a customized error message, you can pass a keyword list with
  message key set.

  ## Example

       struct
       |> cast(params, @fields)
       |> validate_email(:user_email, message: "Your email is not valid.")


  """
  def validate_email(changeset, field \\ :email, opts \\ []) do
    email = get_field(changeset, field)
    case valid? email do
      true -> changeset
      false -> add_error(changeset, field,
       Keyword.get(opts, :message, "Email has invalid format."))
    end
  end
end
