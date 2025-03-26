defmodule List do
  def zeros(list) do
    {non_zeros, zeros} = Enum.partition(list, &(&1 != 0))
    non_zeros ++ zeros
  end

  def run do
    IO.puts("Vuvedete chisla.")
    input = IO.gets("> ") |> String.trim()

    list = input
           |> String.split(",")
           |> Enum.map(&String.trim(&1))
           |> Enum.map(&String.to_integer(&1))

    result = zeros(list)
    IO.puts("Rezultatut e: #{inspect(result)}")
  end
end
