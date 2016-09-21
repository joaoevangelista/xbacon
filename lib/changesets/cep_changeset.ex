defmodule XBacon.Changeset.CEP do
  import Ecto.Changeset
  import XBacon.Matchers.CEP

  @moduledoc """
  Defines a set of validations for CEP that can be applied on a changeset
  using the `XBacon.Matchers.CEP` matchers
  """

  @doc """
  Validates the given changeset looking for the `cep` field,
  it allows customization of lookup field and error messages.

  ## Example

      struct
      |> cast(params, @fields)
      |> validate_cep

  It will look up for a field named :cep to acquire the value, if you
  do not use this name on field you can customize as second arity.

  ## Example

       struct
       |> cast(params, @fields)
       |> validate_cep(:street_cep)


  """
  def validate_cep(changeset, field \\ :cep, opts \\ []) do
    cep = get_field(changeset, field)
    case valid? cep do
      true -> changeset
      false ->
        add_error(changeset, field, Keyword.get(opts, :message, "CEP has invalid format."))
    end
  end
end
