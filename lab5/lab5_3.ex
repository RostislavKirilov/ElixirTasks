defmodule Fast do
  def pow(_, 0), do: 1
  def pow(x, n) do
    pow(x, n, 1)
  end

  defp pow(x, n, acc) when n == 0, do: acc
  defp pow(x, n, acc) when rem(n, 2) == 0 do
    pow(x * x, div(n, 2), acc)
  end
  defp pow(x, n, acc) do
    pow(x * x, div(n - 1, 2), acc * x)
  end

  def run do
    IO.puts("Vuvedete stoinost za x:")
    x = IO.gets("> ") |> String.trim() |> String.to_integer()

    IO.puts("Vuvedete stoinost za n:")
    n = IO.gets("> ") |> String.trim() |> String.to_integer()

    result = pow(x, n)
    IO.puts("X na stepen n e: #{result}")
  end
end
