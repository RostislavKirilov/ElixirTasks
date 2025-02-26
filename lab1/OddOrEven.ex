
defmodule OddOrEven do
  def is_even_or_odd(number) do
    if rem(number, 2) == 0 do
      "Even"
    else
      "Odd"
    end
  end
end
IO.puts OddOrEven.is_even_or_odd(3)
IO.puts OddOrEven.is_even_or_odd(2)
