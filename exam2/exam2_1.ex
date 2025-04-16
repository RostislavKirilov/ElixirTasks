defmodule Student do
  defstruct group: nil, name: "", age: 0, math: 0, informatics: 0, software: 0
  def performance_percentage(%Student{math: m, informatics: i, software: s}), do: (m + i + s) * 100.0 / 300.0
end

defmodule StudentManager do
  @filename "studentPrint.txt"
  def start_link, do: Agent.start_link(fn -> [] end, name: __MODULE__)

  def menu do
    IO.puts("""
    -----------------------------
    Изберете опция:
      1. Добавяне на нов студент
      2. Извеждане на всички записи
      3. Изтриване на запис 
      4. Извеждане на успеваемост
      5. Запис във файла
      6. Преглед на файла
      7. Изход
    -----------------------------
    """)
    IO.gets("Вашият избор: ") |> String.trim() |> process_choice()
  end

  defp process_choice("1"), do: add_student()
  defp process_choice("2"), do: list_students()
  defp process_choice("3"), do: delete_student()
  defp process_choice("4"), do: student_performance()
  defp process_choice("5"), do: save_to_file()
  defp process_choice("6"), do: display_file_contents()
  defp process_choice("7"), do: IO.puts("Изход от програмата.") && :ok
  defp process_choice(_), do: IO.puts("Невалиден избор.") && menu()

  defp add_student do
    group = IO.gets("Номер на група: ") |> String.trim()
    name = IO.gets("Име (три имена): ") |> String.trim()
    age = IO.gets("Възраст: ") |> String.trim() |> String.to_integer()
    math = IO.gets("Математика (0-100): ") |> String.trim() |> String.to_integer()
    informatics = IO.gets("Информатика (0-100): ") |> String.trim() |> String.to_integer()
    software = IO.gets("Софтуерни технологии (0-100): ") |> String.trim() |> String.to_integer()
    student = %Student{group: group, name: name, age: age, math: math, informatics: informatics, software: software}
    Agent.update(__MODULE__, fn list -> [student | list] end)
    IO.puts("Студентът е добавен успешно!") 
    menu()
  end

  defp list_students do
    Agent.get(__MODULE__, & &1)
    |> Enum.each(fn s ->
         IO.puts("""
         -------------------------
         Група: #{s.group}
         Име: #{s.name}
         Възраст: #{s.age}
         Математика: #{s.math}
         Информатика: #{s.informatics}
         Софтуерни технологии: #{s.software}
         Успеваемост: #{Float.round(Student.performance_percentage(s), 2)} %
         """)
       end)
    IO.puts("-------------------------")
    menu()
  end

  defp delete_student do
    name = IO.gets("Въведете името за изтриване: ") |> String.trim()
    Agent.update(__MODULE__, fn list -> Enum.reject(list, &(&1.name == name)) end)
    IO.puts("Студент с име «#{name}» беше изтрит.")
    menu()
  end

  defp student_performance do
    name = IO.gets("Въведете името: ") |> String.trim()
    case Agent.get(__MODULE__, fn list -> Enum.find(list, &(&1.name == name)) end) do
      nil -> IO.puts("Няма запис за #{name}.")
      student -> IO.puts("Успеваемостта на #{student.name} е #{Float.round(Student.performance_percentage(student), 2)} %")
    end
    menu()
  end

  defp save_to_file do
    content = Agent.get(__MODULE__, & &1)
    |> Enum.map(fn s -> "#{s.group},#{s.name},#{s.age},#{s.math},#{s.informatics},#{s.software}" end)
    |> Enum.join("\n")
    case File.write(@filename, content <> "\n", [:append]) do
      :ok -> IO.puts("Данните са записани във файла #{@filename}.")
      {:error, reason} -> IO.puts("Грешка: #{reason}")
    end
    menu()
  end

  defp display_file_contents do
    case File.read(@filename) do
      {:ok, content} -> IO.puts("\nСъдържание на файла #{@filename}:\n#{content}")
      {:error, reason} -> IO.puts("Грешка: #{reason}")
    end
    menu()
  end
end

defmodule Main do
  def run do
    {:ok, _} = StudentManager.start_link()
    StudentManager.menu()
  end
end

Main.run()
