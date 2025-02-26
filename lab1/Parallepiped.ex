defmodule Parallepiped do
  @def surface_area(a,b,c) when a>0 and b>0 and c>0 do
    2*(a*b+a*c+b*c)
  end
