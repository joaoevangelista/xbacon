defmodule XBacon.Changeset.CPF do
  import Ecto.Changeset
  import XBacon.Matchers.CPF

  def validate_cpf(changeset, field \\ :cpf, opts \\ []) do
    cpf = get_field(changeset, field)

    case valid?(cpf) do
      true -> changeset
      false ->
        add_error(changeset, field, Keyword.get(opts, :message, "CPF has invalid format."))
    end
  end

  def validate_strictly_cpf(changeset, field \\ :cpf, opts \\ []) do
    cpf = get_field(changeset, field, "")
    case strictly_valid?(cpf) do
      true -> changeset
      false ->
        add_error(changeset, field, Keyword.get(opts, :message, "CPF digits are not valid."))
    end
  end


end
