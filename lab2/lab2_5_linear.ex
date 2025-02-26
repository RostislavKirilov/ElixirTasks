defmodule Lineinouravnenie do
  def solve do
    IO.puts("Enter 'a': ")
    a = get_number()

    IO.puts("Enter 'b': ")
    b = get_number()

    if a == 0 do
      if b == 0 do
        IO.puts("Neopredelen broi resheniq.")
      else
        IO.puts("Nqma reshenie.")
      end
    else
      x = -b / a
      IO.puts("Reshenieto e #{a} * x + #{b} = 0 x = #{x}")
    end
  end

  defp get_number do
    case IO.gets("") |> String.trim() |> Float.parse() do
      {num, _} -> num
      :error ->
        IO.puts("Greshni danni.")
        get_number()
    end
  end
end

Lineinouravnenie.solve()
