defmodule AdventOfCode.Day01 do
  def part1(args) do
    String.split(args) |>
    Enum.map(&String.to_charlist/1) |>
    Enum.map(&find_ints/1) |>
    Enum.sum()
  end

  def find_ints(row) do
    ints = Enum.filter(row, fn char -> char in ?0..?9 end)
    first = List.first(ints)
    last = List.last(ints)
    [first, last] |> List.to_integer()
  end

  digits = [
      {"eighthree", 83},
      {"eightwo", 82},
      {"fiveight", 58},
      {"threeight", 38},
      {"sevenine", 79},
      {"oneight", 18},
      {"twone", 21},
      {"one", 1},
      {"two", 2},
      {"three", 3},
      {"four", 4},
      {"five", 5},
      {"six", 6},
      {"seven", 7},
      {"eight", 8},
      {"nine", 9},
      {"zero", 0}
    ]


  def part2(args) do
    digits = [
      {"eighthree", 83},
      {"eightwo", 82},
      {"fiveight", 58},
      {"threeight", 38},
      {"sevenine", 79},
      {"oneight", 18},
      {"twone", 21},
      {"one", 1},
      {"two", 2},
      {"three", 3},
      {"four", 4},
      {"five", 5},
      {"six", 6},
      {"seven", 7},
      {"eight", 8},
      {"nine", 9},
      {"zero", 0}
    ]
    String.split(args) |>
    Enum.map(fn line ->
      Enum.reduce(digits, line, fn {word, digit}, acc ->
        String.replace(acc, word, Integer.to_string(digit))
      end)
    end) |>
    Enum.map(&String.to_charlist/1) |>
    Enum.map(&find_ints/1) |>
    Enum.sum()
  end
end
