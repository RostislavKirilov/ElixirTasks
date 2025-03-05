defmodule FindDigit do
  def run do
    sum = get_input("enter collection of (x + y): ")
    diff = get_input("enter the diff between yx and xy (yx - xy): ")

    {x, y} = find_digits(sum, diff)

    if x != nil and y != nil do
      IO.puts("the the digit number is: #{x}#{y}")
    else
      IO.puts("there is not two-digit number found.")
    end
  end

  defp get_input(prompt) do
    IO.puts(prompt)
    input = IO.gets("")
    |> String.trim()
    String.to_integer(input)
  end

  defp find_digits(sum, diff) do
    for x <- 1..9, y <- 0..9 do
      calculated_sum = x + y
      calculated_diff = (10 * y + x) - (10 * x + y)
      if calculated_sum == sum and calculated_diff == diff do
        return {x, y}
      end
    end
    {nil, nil}
  end
end

FindDigit.run()
