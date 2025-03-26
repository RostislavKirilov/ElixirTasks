defmodule Sequence do
  def sum(n) when n >= 1 do
    Enum.sum(0..(n - 1), fn i -> 1 / (1 + 3 * i) end)
  end

  def run do
    IO.puts("Stoinost za n:")
    n = IO.gets("> ") |> String.trim() |> String.to_integer()

    result = sum(n)
    IO.puts("Sumata e = #{n} is: #{result}")
  end
end
