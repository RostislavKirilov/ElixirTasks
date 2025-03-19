defmodule Proizv do
  def product_with_divisors_sum_multiple_of_k(a, b, k) do
    a..b
    |> Enum.filter(&divisors_sum_multiple_of_k?(&1, k))
    |> Enum.reduce(1, &(&1 * &2))
  end

  defp divisors_sum_multiple_of_k?(n, k) do
    sum_of_divisors(n) |> rem(k) == 0
  end

  defp sum_of_divisors(n) do
    1..n
    |> Enum.filter(&(rem(n, &1) == 0))
    |> Enum.sum()
  end
end

IO.puts("proizvedenieto e #{Proizv.product_with_divisors_sum_multiple_of_k(a, b, k)}")
