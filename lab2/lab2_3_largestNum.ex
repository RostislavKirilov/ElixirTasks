defmodule CompareNumbers do
  def find_largest_number do
    num1 = get_number("1st: ")
    num2 = get_number("2-nd: ")
    num3 = get_number("3-rd: ")

    largest_number = max(max(num1, num2), num3)
    IO.puts("largest number: #{largest_number}")
  end

  defp get_number(prompt) do
    IO.puts(prompt)
    case IO.gets("") do
      {:error, _} ->
        IO.puts("Invalid input.")
        get_number(prompt)
      input ->
        input
        |> String.trim()
        |> try_convert_to_float()
    end
  end

  defp try_convert_to_float(input) do
    case Float.parse(input) do
      {float, _} -> float
      :error ->
        IO.puts("Invalid input.")
        get_number("Enter again: ")
    end
  end
end

CompareNumbers.find_largest_number()
