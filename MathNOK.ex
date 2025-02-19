defmodule MathNOK do
  def nod(a,0), do: abs(a)
  def nod(a,b) do: nok(b, rem(a,b))
  def nok(a,b) when a == 0 or b==0, do: 0
  def nok(a,b), do: abs(div(a*b, nok(a,b)))
end
IO.puts MathNOK.lcm(12,15)
