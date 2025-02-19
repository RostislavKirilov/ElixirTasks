defmodule Triangle do
  def angles(a,b,c) when a>0 and b>0 and c>0 do
    alpha = :math.acos((b*b+c*c-a*a) /(2*b*c))
    beta = :math.acos((a*a+c*c-b*b) /(2*a*c))
    gama = :math.acos((a*a+b*b-c*c) /(2*a*b))
    {alpha,beta,gama}
  end
end

IO.puts Triangle.angles(3,4,5)
