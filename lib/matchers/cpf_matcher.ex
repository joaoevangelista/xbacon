defmodule XBacon.Matchers.CPF do

  @cpf_pattern ~r/([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-][0-9]{2})|(d{11})/s

  def valid?(value) do
    Regex.match?(@cpf_pattern, value)
  end

  def strictly_valid?(value) do
    case valid?(value) do
      true ->
        format_to_ints(value) |> match_last_digits?
        false -> false
      end
    end

    defp format_to_ints(value) do
      String.replace(value, ~r/[^\d]/, "")
      |> String.split("", trim: true)
      |> Enum.map(&String.to_integer/1)
    end

    defp match_last_digits?(values) do
      f = Enum.at(values, 9, 0)
      s = Enum.at(values, 10, 0)
      fd = first_digit(values)
      sd = second_digit(values)
      fd == f && sd == s
    end

    defp first_digit(values) do
      sum = Enum.slice(values, 0..9)
      |> sum_reversing
      11 - rem(sum, 11)
    end

    defp second_digit(values) do
      sum = Enum.slice(values, 0..10)
      |> sum_reversing(11)
      11 - rem(sum, 11)
    end

    defp sum_reversing(values, weigth \\ 10, acc \\ 0 , start \\ 0) do
      if weigth >= 2 do
        num = Enum.at(values, start)
        new_acc = acc + (num * weigth)
        sum_reversing(values, weigth - 1, new_acc, start + 1)
      else
        acc
      end

    end
  end
