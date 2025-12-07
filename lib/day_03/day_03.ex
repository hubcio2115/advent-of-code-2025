defmodule Day03 do
  @spec part1(String.t()) :: integer()
  def part1(input) do
    String.split(input, "\n", trim: true)
    |> Enum.reduce(0, fn bank, acc ->
      batteries = String.split(bank, "", trim: true) |> Enum.map(&String.to_integer/1)
      greatest = Enum.max(batteries)

      greatest_idx = Enum.find_index(batteries, fn battery -> battery == greatest end)

      list_to_find = Enum.drop(batteries, greatest_idx + 1)

      value =
        if length(list_to_find) == 0 do
          true_greatest = List.delete_at(batteries, -1) |> Enum.max()
          true_greatest * 10 + greatest
        else
          greatest * 10 + Enum.max(list_to_find)
        end

      value + acc
    end)
  end

  @spec part2(String.t()) :: integer()
  def part2(input) do
    String.split(input, "\n", trim: true)
    |> Enum.reduce(0, fn bank, acc ->
      batteries = String.split(bank, "", trim: true) |> Enum.map(&String.to_integer/1)
      {kept, dropped} = Enum.split(batteries, -0)

      {greatest, greatest_idx} = max_with_index(kept)
    end)
  end

  @spec max_with_index([integer()]) :: {integer(), integer()}
  defp max_with_index([head | tail]), do: max_with_index_rec(tail, 1, {head, 0})

  defp max_with_index([]), do: {0, -1}

  @spec max_with_index_rec([integer()], integer(), {integer(), integer()}) ::
          {integer(), integer()}
  defp max_with_index_rec([], _current_idx, acc), do: acc

  defp max_with_index_rec([head | tail], current_idx, {greatest, idx}) do
    new_acc = if greatest >= head, do: {greatest, idx}, else: {head, current_idx}
    max_with_index_rec(tail, current_idx + 1, new_acc)
  end
end
