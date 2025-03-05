defmodule NumberCheck do
  def increasing_n(n) do
    digits = Integer.digits(n)
    if Enum.chunk_every(digits, 2, 1, :discard)
    |> Enum.all?(fn [a, b] -> a < b end) do
      IO.puts("ascending!")
    else
      IO.puts("not ascending order!")
    end
  end
end

IO.puts("enter number:")
input = IO.gets("")
|> String.trim()
|> String.to_integer()

NumberCheck.increasing_n(input)
