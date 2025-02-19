defmodule Addition do
  def sum(numbers) when is_list(numbers) do
    Enum.sum(numbers)
  end
end

IO.puts Addition.sum([10, 10, 19])
