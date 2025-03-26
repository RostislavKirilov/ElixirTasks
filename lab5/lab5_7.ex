defmodule Binomial do
  def coefficient(_, 0), do: 1
  def coefficient(n, k) when n == k, do: 1
  def coefficient(n, k), do: coefficient(n - 1, k - 1) + coefficient(n - 1, k)

  def run do
    IO.puts("N:")
    n = IO.gets("> ") |> String.trim() |> String.to_integer()

    IO.puts("K:")
    k = IO.gets("> ") |> String.trim() |> String.to_integer()

    result = coefficient(n, k)
    IO.puts("Coef e: #{result}")
  end
end
