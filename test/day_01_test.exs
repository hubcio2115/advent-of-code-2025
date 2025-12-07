defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  test "correctly counts times that counter points to 0" do
    input = """
    L68
    L30
    R48
    L5
    R60
    L55
    L1
    L99
    R14
    L82
    """

    assert Day01.part1(input) == 3
  end

  test "correctly counts times that counter passes or points to 0" do
    input = """
    L68
    L30
    R48
    L5
    R60
    L55
    L1
    L99
    R14
    L82
    """

    assert Day01.part2(input) == 6
  end
end
