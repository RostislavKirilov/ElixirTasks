defmodule DivisorProduct do
  def product(a, b, k) do
    a..b
    |> Enum.filter(&(rem(sum_divisors(&1), k) == 0))
    |> Enum.product()
  end

  defp sum(n) do
    1..:math.sqrt(n) |> Enum.filter(&(rem(n, &1) == 0))
    |> Enum.flat_map(fn divisor ->
      if divisor == n div divisor do
        [divisor]
      else
        [divisor, n div divisor]
      end
    end)
    |> Enum.sum()
  end

  def run do
    IO.puts("A:")
    a = IO.gets("> ") |> String.trim() |> String.to_integer()

    IO.puts("B:")
    b = IO.gets("> ") |> String.trim() |> String.to_integer()

    IO.puts("K:")
    k = IO.gets("> ") |> String.trim() |> String.to_integer()

    result = product(a, b, k)

    IO.puts("Resultatut e: #{result}")
  end
end
