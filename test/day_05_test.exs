defmodule Day05Test do
  use ExUnit.Case
  doctest Day05

  test "correctly identifies IDs of fresh products and categorises them" do
    input = """
    3-5
    10-14
    16-20
    12-18

    1
    5
    8
    11
    17
    32
    """

    assert Day05.part1(input) == 3
  end

  test "correctly identifies IDs of fresh products" do
    input = """
    3-5
    10-14
    16-20
    12-18
    """

    assert Day05.part2(input) == 14
  end
end
