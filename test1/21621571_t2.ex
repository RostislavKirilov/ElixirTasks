defmodule Sortirai do
  def sort do
    IO.puts("vuvedi text:")
    input = IO.gets("") |> String.trim()
    input
    |> String.split()
    |> Enum.sort(:desc)
    |> Enum.each(&IO.puts(&1))
  end
end
Sortirai.sort()
