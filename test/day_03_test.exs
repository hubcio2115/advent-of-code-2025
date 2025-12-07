defmodule Day03Test do
  use ExUnit.Case
  doctest Day03

  test "correctly finds pairs producing the greates voltage for two digits" do
    input = """
    987654321111111
    811111111111119
    234234234234278
    818181911112111
    """

    assert Day03.part1(input) == 357
  end

  test "correctly finds pairs producing the greates voltage for twelve digits" do
    input = """
    987654321111111
    811111111111119
    234234234234278
    818181911112111
    """

    assert Day03.part2(input) == 357
  end
end
