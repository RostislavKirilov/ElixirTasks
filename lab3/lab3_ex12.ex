defmodule SymmetricNumber do
  def run do
    number = get_input("enter number: ")

    symmetric_number = find_symmetric_number(number)
    IO.puts("the symmetric is #{number}: #{symmetric_number}")
  end

  defp get_input(prompt) do
    IO.puts(prompt)
    input = IO.gets("")
    |> String.trim()
    String.to_integer(input)
  end

  defp find_symmetric_number(number) do
    sign = if number < 0, do: "-", else: ""
    digits = Integer.to_string(abs(number))
    |> String.reverse()
    String.to_integer(sign <> digits)
  end
end

SymmetricNumber.run()
