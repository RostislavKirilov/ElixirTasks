defmodule SortNumbers do
  def sort_numbers do
    IO.puts("Enter 3 numbers: ")

    input = IO.gets("") |> String.trim() |> String.split()

    if length(input) == 3 do
      numbers = Enum.map(input, &String.to_float/1)
      sorted_numbers = Enum.sort(numbers)
      IO.puts("Sorted: " <> Enum.join(sorted_numbers, " "))
    else
      IO.puts("Invalid input.")
    end
  end
end

SortNumbers.sort_numbers()
