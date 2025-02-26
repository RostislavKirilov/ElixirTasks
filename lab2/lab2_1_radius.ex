defmodule Circle do
  def calculate do
    IO.puts "Enter the radius: "

    r = IO.gets("")
    r = String.trim(r)
    r = String.to_float(r)

    perimeter = 2 * :math.pi() * r

    IO.puts "Perimeter is: #{perimeter}"
  end
end

Circle.calculate()
