![bacon](https://github.com/joaoevangelista/xbacon/blob/master/art/bacon.png)
# xBacon

[![Build Status](https://travis-ci.org/joaoevangelista/xbacon.svg?branch=master)](https://travis-ci.org/joaoevangelista/xbacon)

A set of validators and matchers, focusing on Brazilian needs, but general too!

Here you can find useful validations for your changeset, or just matchers if you want!

Available validations
---

 - CPF

Planned
---

 - [ ] CNPJ
 - [ ] CEP
 - [ ] Titulo Eleitor
 - [ ] Email


---------------

How do I use it ?
-----

Simply import the changeset module into your model
and pipe the validations on your changeset!


```elixir
defmodule App.Person do
  import XBacon.Changeset.CPF

  # ....

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @fields)
    |> validate_required(@req_fields)
    |> validate_cpf
  end
end
```

The validators use a default field naming matching the subject being validated,
for example, if you are validating CPF with `validate_cpf/2` you can provide an
atom as second arity if your field is not named `:cpf`

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `xbacon` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:xbacon, "~> 0.1.0"}]
    end
    ```

  2. Ensure `xbacon` is started before your application:

    ```elixir
    def application do
      [applications: [:xbacon]]
    end
    ```


-----

Icons made by [Freepick](http://www.freepik.com)
