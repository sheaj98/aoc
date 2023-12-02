defmodule AdventOfCode.Day02 do
  def parse_input(input) do
    String.split(input, "\n", trim: true) |>
    Map.new(fn line ->
      ["Game " <> id | sets] = String.split(line, [": ", "; "])
      sets = sets
      |> Enum.map(fn set -> 
          String.split(set, [" ", ", "])
          |> Enum.chunk_every(2)
          |> Map.new(fn [number, colour] -> {colour, String.to_integer(number)} end) 
        end)
      # Merge all rounds together to just have the max
      |> Enum.reduce(
          %{"red" => 0, "green" => 0, "blue" => 0},
          &Map.merge(&1, &2, fn _colour, count1, count2 -> max(count1, count2) end)
        )
      {String.to_integer(id), sets}
    end)
  end
  def part1(args) do
    total_red = 12
    total_blue = 14
    total_green = 13
    
    args
    |> parse_input()
    |> Map.filter(fn { _gameId, maxDrawn } -> 
      maxDrawn["red"] <= total_red and maxDrawn["green"] <= total_green and maxDrawn["blue"] <= total_blue
    end)
    |> Map.keys()
    |> Enum.sum()
  end

  def part2(args) do
    args
    |> parse_input()
    |> Enum.map(fn {_gameId, maxDrawn} ->
      Map.values(maxDrawn)
      |> Enum.product()
    end)
    |> Enum.sum()
  end
end
