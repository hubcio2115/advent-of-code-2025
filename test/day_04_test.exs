defmodule Day04Test do
  use ExUnit.Case
  doctest Day04

  test "correctly finds pairs producing the greates voltage for two digits" do
    input = """
    ..@@.@@@@.
    @@@.@.@.@@
    @@@@@.@.@@
    @.@@@@..@.
    @@.@@@@.@@
    .@@@@@@@.@
    .@.@.@.@@@
    @.@@@.@@@@
    .@@@@@@@@.
    @.@.@@@.@.
    """

    assert Day04.part1(input) == 13
  end
end
