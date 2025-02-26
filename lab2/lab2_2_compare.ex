defmodule CompareNumbers do
  def find_larger_number do
    num1 = get_number("First number: ")
    num2 = get_number("Second number: ")

    larger_number = max(num1, num2)
    IO.puts "Larger number is: #{larger_number}"
  end

  defp get_number(prompt) do
    IO.puts prompt
    case IO.gets("") do
      {:error, _} ->
        IO.puts "Invalid input. Please enter a valid number."
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
        IO.puts "Invalid number. Enter a valid number."
        get_number("Try again: ")
    end
  end
end

CompareNumbers.find_larger_number()
