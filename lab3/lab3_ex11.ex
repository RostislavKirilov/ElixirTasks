defmodule MinMaxDigits do
  def run do
    number = get_input("enter positive number: ")
    {min_digit, max_digit} = find_min_max_digits(number)

    IO.puts("smallest number: #{min_digit}")
    IO.puts("biggest number: #{max_digit}")
  end

  defp get_input(prompt) do
    IO.puts(prompt)
    input = IO.gets("")
    |> String.trim()
    String.to_integer(input)
  end

  defp find_min_max_digits(number) do
    digits = Integer.to_string(number)
    digits_list = String.graphemes(digits)

    |> Enum.map(&String.to_integer/1)

                   min_digit = Enum.min(digits_list)
    max_digit = Enum.max(digits_list)

    {min_digit, max_digit}
  end
end

MinMaxDigits.run()
