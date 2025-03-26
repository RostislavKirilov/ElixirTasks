defmodule DigitSum do
  def smallest_divisible(a, b, k) do
    a..b
    |> Enum.find(fn num -> rem(sum_digits(num), k) == 0 end)
  end

  defp sum_digits(n) do
    Integer.digits(n)
    |> Enum.sum()
  end

  def run do
    IO.puts("A:")
    a = IO.gets("> ") |> String.trim() |> String.to_integer()

    IO.puts("B:")
    b = IO.gets("> ") |> String.trim() |> String.to_integer()

    IO.puts("K:")
    k = IO.gets("> ") |> String.trim() |> String.to_integer()

    result = smallest_divisible(a, b, k)

    if result do
      IO.puts("Purvoto okrito chislo e: #{result}")
    else
      IO.puts("Ne e otkrito chislo.")
    end
  end
end
