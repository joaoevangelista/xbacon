defmodule XBacon.Changeset.CPF do
  import Ecto.Changeset
  import XBacon.Matchers.CPF

  @doc """
  Validates the given field on `changeset` inflecting the rules for CPF
  Accepted formats are:
    - xxx.xxx.xxx-xx
    - xxxxxxxxx-xx
  The validated field defaults to `cpf` following the convetion of function name
  to change it you can pass a atom as second arity as the name of your field,
  example: `validate_cpf(changeset, :cadastro_pessoa_fisica)`

  To customize the error message you need to pass a keyword as thrid arity,
  example: `validate_cpf(changeset, :cpf, message: "My message")`

  """
  def validate_cpf(changeset, field \\ :cpf, opts \\ []) do
    cpf = get_field(changeset, field)

    case valid?(cpf) do
      true -> changeset
      false ->
        add_error(changeset, field, Keyword.get(opts, :message, "CPF has invalid format."))
      end
    end

    @doc """
    Validates the cpf format and also validates the verification digits
    (the last two digits) from the `changeset`

    Both the field and error messages can be customizeds. The field defaults
    to `:cpf` as the function name implies, customization can be used like:
    `validate_cpf_strictly(changeset, :cadastro_pessoa_fisica)`

    The error message can be customized using a `message:` keyword like:
    `validate_cpf_strictly(changeset, :cpf, message: "My error message")`
    """
    def validate_cpf_strictly(changeset, field \\ :cpf, opts \\ []) do
      cpf = get_field(changeset, field, "")
      case strictly_valid?(cpf) do
        true -> changeset
        false ->
          add_error(changeset, field, Keyword.get(opts, :message, "CPF digits are not valid."))
        end
      end
    end
