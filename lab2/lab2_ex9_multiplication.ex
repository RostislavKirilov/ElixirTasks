defmodule Proizv do
  def check do
    IO.puts("four digit number:")

    input = IO.gets("") |> String.trim()

    case validate_input(input) do
      true ->
        digits = String.graphemes(input) |> Enum.map(&String.to_integer/1)
        product = Enum.reduce(digits, 1, &(&1 * &2))

        if rem(product, 3) == 0 do
          IO.puts("kratno na 3.")
        else
          IO.puts("ne e kratno na 3.")
        end

      false ->
        IO.puts("vuvedete pravilno chislo.")
    end
  end

  # private funkciq
  defp validate_input(input) do
    String.length(input) == 4 && is_integer_string?(input)
  end

  defp is_integer_string?(input) do
    Regex.match?(~r/^\d+$/, input)
  end
end

Proizv.check()
