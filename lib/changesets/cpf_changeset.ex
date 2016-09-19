defmodule XBacon.Changeset.CPF do
  import Ecto.Changeset

  def validate_cpf(changeset, field \\ :cpf, opts \\ []) do
    cpf = get_field(changeset, field)

    case XBacon.Matchers.CPF.valid?(cpf) do
      true -> changeset
      false ->
        add_error(changeset, field, Keyword.get(opts, :message, "CPF has invalid format."))
    end
  end


end
