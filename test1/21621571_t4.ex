defmodule PerfectNumber do
  def perfect?(n) do
    sum_of_divisors(n) == n
  end

  defp sum_of_divisors(n) do
    1..(n-1)
    |> Enum.filter(&(rem(n, &1) == 0))
    |> Enum.sum()
  end
end

IO.puts("vuvedi chislo:")
n = String.trim(IO.gets("")) |> String.to_integer()
if PerfectNumber.perfect?(n) do
  IO.puts("#{n} suvurshenno e.")
else
  IO.puts("#{n} ne e suvurshenno.")
end
