defmodule Day04Test do
  use ExUnit.Case
  doctest Day04

  test "correctly finds rolls that can be safely removed" do
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
