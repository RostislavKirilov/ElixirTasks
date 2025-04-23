

defmodule YugiohCLI do

  defmodule Card do
    defstruct [:id, :name, :type, :attribute, :level, :attack, :defense]
  end

  @file_path "cardCollection.txt"

  defp create_card(id, name, type, attribute, level, attack, defense) do
    %Card{id: id, name: name, type: type, attribute: attribute,
          level: level, attack: attack, defense: defense}
  end

  defp add_card(list, card),    do: list ++ [card]
  defp delete_card(list, id),   do: Enum.reject(list, fn %Card{id: cid} -> cid == id end)
  defp power_percentage(%Card{attack: a, defense: d}),
    do: Float.round((a + d) / 10_000 * 100, 2)

  defp save_to_file(list) do
    data =
      list
      |> Enum.map_join("\n", fn %Card{id: id, name: nm, type: tp, attribute: at, level: lvl, attack: atk, defense: df} ->
        "#{id},#{nm},#{tp},#{at},#{lvl},#{atk},#{df}"
      end)
      |> Kernel.<>("\n")

    File.write!(@file_path, data, [:append])
  end

  defp print_file_contents do
    case File.read(@file_path) do
      {:ok, content} ->
        IO.puts("\n=== Съдържание на #{@file_path} ===\n" <> content)
      {:error, reason} ->
        IO.puts("Грешка при четене на файла: #{reason}")
    end
  end

  defp prompt(msg) do
    IO.gets(msg)
    |> case do
      :eof -> raise "Неочаквано EOF"
      {:error, reason} -> raise "Грешка при въвеждане: #{inspect(reason)}"
      data -> String.trim(data)
    end
  end

  defp prompt_integer(msg) do
    prompt(msg)
    |> Integer.parse()
    |> case do
      {int, ""} -> int
      _ ->
        IO.puts("Моля, въведете цяло число.")
        prompt_integer(msg)
    end
  end

  defp prompt_atom(msg, allowed) do
    input = prompt(msg)
    atom  = String.to_atom(input)

    if atom not in allowed do
      IO.puts("Невалиден избор. Допустими: #{Enum.join(Enum.map(allowed, &Atom.to_string/1), ", ")}")
      prompt_atom(msg, allowed)
    else
      atom
    end
  end

  defp prompt_card do
    id      = prompt_integer("Въведете ID (integer): ")
    name    = prompt("Въведете име на картата: ")
    type    = prompt_atom("Въведете тип (:monster, :spell, :trap): ", [:monster, :spell, :trap])
    attr    = prompt_atom("Въведете атрибут (:EARTH, :WATER, :FIRE, :WIND, :LIGHT, :DARK): ",
                          [:EARTH, :WATER, :FIRE, :WIND, :LIGHT, :DARK])
    level   = prompt_integer("Въведете ниво (1–12): ")
    attack  = prompt_integer("Въведете атака (0–5000): ")
    defense = prompt_integer("Въведете защита (0–5000): ")

    create_card(id, name, type, attr, level, attack, defense)
  end


  defp print_menu do
    IO.puts("""
    \n=== Yu-Gi-Oh! Card Manager ===
    1) Добави карта
    2) Покажи всички карти
    3) Изтрий карта по ID
    4) Изчисли сила на карта (в проценти)
    5) Запиши в файл (append)
    6) Покажи съдържанието на файла
    0) Изход
    """)
  end

  defp loop(card_list) do
    print_menu()
    case prompt("Избор: ") do
      "1" ->
        card = prompt_card()
        IO.puts("Карта добавена: #{card.name}")
        loop(add_card(card_list, card))

      "2" ->
        Enum.each(card_list, &IO.inspect/1)
        loop(card_list)

      "3" ->
        id       = prompt_integer("Въведете ID на картата за изтриване: ")
        new_list = delete_card(card_list, id)
        IO.puts("Карти след изтриване: #{length(new_list)}")
        loop(new_list)

      "4" ->
        id = prompt_integer("Въведете ID на картата за сила: ")
        case Enum.find(card_list, fn %Card{id: cid} -> cid == id end) do
          nil   -> IO.puts("Няма карта с такова ID.")
          card  -> IO.puts("Сила на #{card.name}: #{power_percentage(card)}%")
        end
        loop(card_list)

      "5" ->
        save_to_file(card_list)
        IO.puts("Запис в #{@file_path} извършен.")
        loop(card_list)

      "6" ->
        print_file_contents()
        loop(card_list)

      "0" ->
        IO.puts("Край. Довиждане!")

      _ ->
        IO.puts("Невалиден избор, опитайте пак.")
        loop(card_list)
    end
  end

  def main(_args) do
    loop([])
  end
end

YugiohCLI.main(System.argv())
