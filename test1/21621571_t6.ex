defmodule CoinCombos do
  def combos(a, coins) do
    combos(a, coins, [])
  end

  defp combos(0, _coins, combo), do: IO.inspect(combo)
  defp combos(_, [], _combo), do: :ok
  defp combos(a, [coin | rest], combo) when a >= coin do
    combos(a - coin, rest, [coin | combo])
    combos(a, rest, combo)
  end
  defp combos(a, [_coin | rest], combo), do: combos(a, rest, combo)
end

IO.puts("celeva suma: ")
a = String.trim(IO.gets("")) |> String.to_integer()

IO.puts("vuvedete monetite: ")
coins = IO.gets("")
        |> String.trim()
        |> String.split(" ")
        |> Enum.map(&String.to_integer/1)


CoinCombos.combos(a, coins)
