defmodule StrawBoxes do
  def boxes(straw_count) when is_integer(straw_count) and straw_count >= 0 do
    large_boxes = div(straw_count, 50)
    remaining_straw = rem(straw_count,50)

    medium_boxes = div(straw_count, 20)
    remaining_straw = rem(remaining_straw, 20)

    small_boxes = div(straw_count, 5)
    remaining_straw = rem(remaining_straw, 5)

    if remaining_straw > 0 do
      small_boxes = small_boxes + 1
    end

      {large_boxes, medium_boxes, small_boxes}
  end
end

IO.puts StrawBoxes.boxes(180)
