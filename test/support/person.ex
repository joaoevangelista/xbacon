defmodule XBacon.Person do
  use Ecto.Schema

  import Ecto
  import Ecto.Changeset
  import Ecto.Query

  schema "persons" do
    field :cpf, :string
    field :cnpj, :string
  end

  @fields ~w(cpf cnpj)a

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @fields)

  end
end
