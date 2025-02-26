defmodule ProveriSimvol do
  def proveri do
    IO.puts("Vuvedi simvol:")

    input = IO.gets("") |> String.trim

    if String.length(input) == 1 do
      if is_number?(input) do
        IO.puts("Chislo e.")
      else
        IO.puts("Ne e chislo.")
      end
    else
      IO.puts("Samo edin simvol moje da se vuvejda.")
    end
  end

  defp is_number?(input) do
    char_code = String.to_charlist(input)
    char_code >= 48 and char_code <= 57
  end
end

ProveriSimvol.proveri()
