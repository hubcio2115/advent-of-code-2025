defmodule Day01 do
  @moduledoc """
  Documentation for `Day01`.
  """

  @starting_position 50

  @spec part1(String.t()) :: integer()
  def part1(input) when is_bitstring(input) do
    lines = String.split(input, "\n", trim: true)

    Enum.reduce(lines, {0, @starting_position}, fn line, {value, current_position} ->
      direction = String.at(line, 0)

      count =
        String.split(line, direction, trim: true) |> Enum.at(0) |> String.to_integer(10)

      new_position =
        if direction == "R" do
          Integer.mod(current_position + count, 100)
        else
          Integer.mod(current_position - count, 100)
        end

      if new_position == 0 do
        {value + 1, new_position}
      else
        {value, new_position}
      end
    end)
    |> elem(0)
  end

  @spec part2(String.t()) :: integer()
  def part2(input) when is_bitstring(input) do
    lines = String.split(input, "\n", trim: true)

    Enum.reduce(lines, {0, @starting_position}, fn line, {value, current_position} ->
      direction = String.at(line, 0)

      count =
        String.split(line, direction, trim: true) |> Enum.at(0) |> String.to_integer(10)

      {new_position, passed_zero, multi} =
        if direction == "R" do
          passed_zero =
            if current_position != 0, do: current_position + count >= 100, else: false

          {Integer.mod(current_position + count, 100), passed_zero, div(count, 100)}
        else
          passed_zero =
            if current_position != 0, do: current_position - count <= 0, else: false

          {Integer.mod(current_position - count, 100), passed_zero, div(count, 100)}
        end

      step = 1 * multi + if(passed_zero, do: 1, else: 0)
      {value + step, new_position}
    end)
    |> elem(0)
  end
end
