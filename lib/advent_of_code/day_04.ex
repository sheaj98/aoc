defmodule AdventOfCode.Day04 do
  def parseInput(input) do
    String.split(input, "\n", trim: true)
    |> Map.new(fn line ->
      ["Card " <> id | numbers] = String.split(line, [": ", " | "])
      [owned, winners] = numbers
      owned = MapSet.new(String.split(owned, " ", trim: true))
      winners = MapSet.new(String.split(winners, " ", trim: true))
      owned_winners = MapSet.intersection(owned, winners)
      |> Enum.uniq()
      {String.to_integer(String.trim(id)), owned_winners}
    end)
  end
  def part1(args) do
    parseInput(args)
    |> Enum.map(fn {_id, winning_numbers}-> 
      case length(winning_numbers) do
        0 -> 0
        length -> round(:math.pow(2, length-1))
      end
    end)
    |> Enum.sum()
  end

  def part2(_args) do
  end
end
