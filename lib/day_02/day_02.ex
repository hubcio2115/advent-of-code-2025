defmodule Day02 do
  @spec part1(String.t()) :: integer()
  def part1(input) when is_bitstring(input) do
    String.split(input, ",")
    |> Enum.reduce(0, fn str, acc ->
      [left, right] = String.split(str, "-") |> Enum.map(&String.to_integer/1)
      range = left..right

      value = Enum.filter(range, &is_silly/1) |> Enum.sum()

      acc + value
    end)
  end

  @spec is_silly(integer()) :: boolean()
  defp is_silly(number) when is_integer(number) do
    number_str = Integer.to_string(number)

    len = String.length(number_str)
    has_even_length = Integer.mod(len, 2) == 0

    if !has_even_length do
      false
    end

    middle_idx = div(len, 2)
    left = String.slice(number_str, 0, middle_idx)
    right = String.slice(number_str, middle_idx, len - middle_idx)

    left == right
  end

  @spec part2(String.t()) :: integer()
  def part2(input) when is_bitstring(input) do
    String.split(input, ",")
    |> Enum.reduce(0, fn str, acc ->
      [left, right] = String.split(str, "-") |> Enum.map(&String.to_integer/1)
      range = left..right

      value = Enum.filter(range, &is_silly_part2/1) |> Enum.sum()

      acc + value
    end)
  end

  @spec is_silly_part2(integer()) :: boolean()
  defp is_silly_part2(number) when is_integer(number) do
    str = Integer.to_string(number)
    len = String.length(str)

    concated = str <> str

    middle = String.slice(concated, 1, String.length(concated) - 2)

    len > 1 and String.contains?(middle, str)
  end
end
