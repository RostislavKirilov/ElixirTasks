defmodule Employees do
  defmodule Tech do
    @enforce_keys [:firstname, :middlename, :surname, :job, :workingdays, :vacationdays]
    defstruct @enforce_keys ++ [:monthlysalary]
  end

  def input_employee() do
    firstname = IO.gets("Enter First Name: ") |> String.trim()
    middlename = IO.gets("Enter Middle Name: ") |> String.trim()
    surname = IO.gets("Enter Surname: ") |> String.trim()
    job = IO.gets("Enter Job Position: ") |> String.trim()
    workingdays = IO.gets("Enter Working Days: ") |> String.trim() |> String.to_integer()
    vacationdays = IO.gets("Enter Vacation Days: ") |> String.trim() |> String.to_integer()
    daily_rate = IO.gets("Enter Daily Rate (default 21): ") |> String.trim()

    daily_rate = if daily_rate == "", do: 21, else: String.to_integer(daily_rate)

    %Tech{
      firstname: firstname,
      middlename: middlename,
      surname: surname,
      job: job,
      workingdays: workingdays,
      vacationdays: vacationdays,
      monthlysalary: workingdays * daily_rate
    }
  end

  def sort_employees(employees) do
    employees
    |> Enum.sort_by(& &1.firstname)
    |> Enum.sort_by(& &1.monthlysalary, :desc)
  end

  def write_to_file(employees, filename \\ "employees.txt") do
    {:ok, file} = File.open(filename, [:append])

    Enum.each(employees, fn employee ->
      IO.binwrite(file, """
      #{employee.firstname},#{employee.middlename},#{employee.surname},#{employee.job},#{employee.monthlysalary},#{employee.workingdays},#{employee.vacationdays}
      """)
    end)

    File.close(file)
  end

  def run do
    IO.puts("3 employees:")
    employees = Enum.map(1..3, fn _ -> input_employee() end)

    sorted_employees = sort_employees(employees)

    IO.puts("\n= Sorted =")
    Enum.each(sorted_employees, fn emp ->
      IO.puts("""
      Name: #{emp.firstname} #{emp.middlename} #{emp.surname}
      Job: #{emp.job}
      Salary: #{emp.monthlysalary}
      Days: #{emp.workingdays}
      Vacation: #{emp.vacationdays}
      """)
    end)

    write_to_file(sorted_employees)
  end
end
Employees.run()
