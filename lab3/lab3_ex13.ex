defmodule SumOfEveryThird do
  def run do
    sum = calculate_sum(2, 100)
    IO.puts("the sum of every 3-rd number from 2 to 100 is: #{sum}")
  end

  defp calculate_sum(start, limit) do
    Enum.reduce_while(start..limit, 0, fn number, acc ->
      if rem(number - 2, 3) == 0 do
        {:cont, acc + number}
      else
        {:cont, acc}
      end
    end)
  end
end

SumOfEveryThird.run()
