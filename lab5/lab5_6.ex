defmodule Duplicate do
  def duplicates(list1, list2) do
    Enum.filter(list1, fn x -> Enum.count(list2, &(&1 == x)) > 1 end)
  end
end
