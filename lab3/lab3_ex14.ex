defmodule SumOfMultiplesOfThree do
  def run do
    sum = calculate_sum(0, 100)

    IO.puts("the sum of numbers between 0 and 100, which are divisible by 3: #{sum}")
  end

  defp calculate_sum(start, limit) do
    start..limit
    |> Enum.filter(&rem(&1, 3) == 0)
    |> Enum.sum()
  end
end

SumOfMultiplesOfThree.run()
