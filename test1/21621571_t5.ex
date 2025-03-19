defmodule ProstoChislo do
  def next(n) do
    n + 1
    |> Stream.iterate(&(&1 + 1))
    |> Enum.find(&is_prime?/1)
  end

  defp is_prime?(n) when n <= 1, do: false
  defp is_prime?(n) do
    2..:math.sqrt(n) |> Enum.all?(fn i -> rem(n, i) != 0 end)
  end
end

IO.puts("vuvedete chislo: ")
n = String.trim(IO.gets("")) |> String.to_integer()
IO.puts("next number is: #{ProstoChislo.next(n)}")
