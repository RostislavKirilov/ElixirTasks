defmodule NumberCheck do
  def check_numbers do
    IO.puts("vuvedi tri chiclsa, bez nula:")

    input = IO.gets("") |> String.trim() |> String.split()
    numbers = Enum.map(input, &String.to_integer/1)

    if Enum.all?(numbers, fn n -> n != 0 end) do
      even_numbers = Enum.filter(numbers, &rem(&1, 2) == 0)
      odd_numbers = Enum.filter(numbers, &rem(&1, 2) != 0)

      cond do
        even_numbers != [] and odd_numbers != [] ->
          max_even = Enum.max(even_numbers)
          min_odd = Enum.min(odd_numbers)
          IO.puts("razlikata mejdu max even i min odd e: #{max_even - min_odd}")

        odd_numbers != [] and even_numbers == [] ->
          IO.puts("min idd is: #{Enum.min(odd_numbers)}")

        even_numbers != [] and odd_numbers == [] ->
          IO.puts("max even is: #{Enum.max(even_numbers)}")
      end
    else
      IO.puts("vuvedi tri chiclsa, bez nula:")
    end
  end
end

NumberCheck.check_numbers()
