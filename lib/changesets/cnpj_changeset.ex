defmodule XBacon.Changeset.CNPJ do
  import Ecto.Changeset

  @moduledoc """
  Defines a set of validations that can be applied on a changeset
  using the `XBacon.Matchers.CNPJ` matchers
  """
  @doc """
  Validates the given changeset looking for the `cnpj` field.
   ## Example

      struct
      |> cast(params, @fields)
      |> validate_cnpj

  It will look up for a field named :cnpj to acquire the value, if you
  do not use this name on field you can customize as second arity.

   ## Example

       struct
       |> cast(params, @fields)
       |> validate_cnpj(:cadastro_juridico)


  """
  def validate_cnpj(changeset, field \\ :cnpj, opts \\ []) do
    cnpj = get_field(changeset, field)
    case XBacon.Matchers.CNPJ.valid? cnpj do
      true -> changeset
      false ->
        add_error(changeset, field, Keyword.get(opts, :message, "CNPJ has invalid format."))
    end
  end

end
