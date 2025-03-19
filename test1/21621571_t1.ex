defmodule Unikalni do
  def generirane do
    1000..9999
    |> Enum.filter(&unique_digits?(&1))
    |> Enum.each(&IO.puts(&1))
  end

  def count_unique_numbers do
    1000..9999
    |> Enum.filter(&unique_digits?(&1))
    |> length()
  end

  defp unique_digits?(number) do
    digits = Integer.digits(number)
    Enum.uniq(digits) == digits
  end
end

Unikalni.generate_numbers()
IO.puts("broqt e: #{Unikalni.count_unique_numbers()}")
