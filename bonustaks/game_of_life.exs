]defmodule GameOfLife do
  def run do
    :rand.seed(:exsplus, :os.timestamp())
    IO.puts("Добре дошли в играта 'Живот'!")
    rows = get_int("Въведете брой редове: ")
    cols = get_int("Въведете брой колони: ")
    live_cells = random_board(rows, cols)
    game_loop(live_cells, rows, cols)
  end

  defp get_int(prompt) do
    input = IO.gets(prompt) |> String.trim()
    case Integer.parse(input) do
      {num, _} -> num
      :error ->
        IO.puts("Моля, въведете валидно число.")
        get_int(prompt)
    end
  end

  defp random_board(rows, cols) do
    probability = 0.3
    board =
      for row <- 0..(rows - 1),
          col <- 0..(cols - 1),
          :rand.uniform() < probability,
          do: {row, col}
    MapSet.new(board)
  end

  defp print_board(live_cells, rows, cols) do
    for row <- 0..(rows - 1) do
      row_str =
        for col <- 0..(cols - 1), into: "" do
          if MapSet.member?(live_cells, {row, col}), do: "*", else: " "
        end
      IO.puts(row_str)
    end
  end

  defp game_loop(live_cells, rows, cols) do
    IO.puts("\nПоколение:")
    print_board(live_cells, rows, cols)
    IO.puts("\nНатиснете Enter за следващо поколение или 'q' за изход.")
    case IO.gets("") |> String.trim() do
      "q" ->
        IO.puts("Изход от играта. Благодаря, че играхте!")
        :ok

      _ ->
        next_live_cells = next_generation(live_cells, rows, cols)
        game_loop(next_live_cells, rows, cols)
    end
  end

  defp next_generation(live_cells, rows, cols) do
    candidates =
      live_cells
      |> Enum.flat_map(&neighbors/1)
      |> Enum.concat(MapSet.to_list(live_cells))
      |> Enum.uniq()

    Enum.reduce(candidates, MapSet.new(), fn cell, acc ->
      live_count = live_neighbors(cell, live_cells, rows, cols)
      cond do
        MapSet.member?(live_cells, cell) and (live_count == 2 or live_count == 3) ->
          MapSet.put(acc, cell)
        (not MapSet.member?(live_cells, cell)) and live_count == 3 ->
          MapSet.put(acc, cell)
        true ->
          acc
      end
    end)
  end

  defp live_neighbors({row, col}, live_cells, rows, cols) do
    neighbors({row, col})
    |> Enum.filter(fn {r, c} ->
      in_bounds?({r, c}, rows, cols) and MapSet.member?(live_cells, {r, c})
    end)
    |> length()
  end

  defp neighbors({row, col}) do
    for dr <- -1..1,
        dc <- -1..1,
        {dr, dc} != {0, 0},
        do: {row + dr, col + dc}
  end

  defp in_bounds?({row, col}, rows, cols) do
    row >= 0 and row < rows and col >= 0 and col < cols
  end
end

GameOfLife.run()
