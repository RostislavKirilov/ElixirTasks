defmodule Simetrika do
  def check_simetrika do
    IO.puts("four digit number:")

    input = IO.gets("") |> String.trim()

    case validate_input(input) do
      true ->
        if simetrichno?(input) do
          IO.puts("simetrichno e.")
        else
          IO.puts("ne e simetrichno.")
        end

      false ->
        IO.puts("vuvedete pravilno chislo.")
    end
  end

  defp validate_input(input) do
    String.length(input) == 4 && is_integer_string?(input)
  end

  defp is_integer_string?(input) do
    Regex.match?(~r/^\d+$/, input)
  end

  defp simetrichno?(input) do
    input == String.reverse(input)
  end
end

Simetrika.check_simetrika()
