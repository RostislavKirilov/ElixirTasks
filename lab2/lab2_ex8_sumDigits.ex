defmodule SumDigits do
  def check_even_sum_of_digits do
    IO.puts("Vuvedete tricifreno chislo:")

    input = IO.gets("") |> String.trim()

    case validate_input(input) do
      true ->
        digits = String.graphemes(input) |> Enum.map(&String.to_integer/1)
        sum = Enum.sum(digits)

        if rem(sum, 2) == 0 do
          IO.puts("Sumata e chetno chislo.")
        else
          IO.puts("Sumata e nechetno chislo.")
        end

      false ->
        IO.puts("Vuvedete pravilno chislo.")
    end
  end

  defp validate_input(input) do
    String.length(input) == 3 && is_integer_string?(input)
  end

  defp is_integer_string?(input) do
    Regex.match?(~r/^\d+$/, input)
  end
end

SumDigits.check_even_sum_of_digits()
