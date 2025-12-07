defmodule Day05 do
  @spec part1(String.t()) :: integer()
  def part1(input) do
    [fresh_id_range, available_ids] = String.split(input, "\n\n", trim: true)

    fresh_ranges =
      String.split(fresh_id_range, "\n", trim: true)
      |> Enum.map(fn str ->
        [left, right] = String.split(str, "-", trim: true) |> Enum.map(&String.to_integer/1)

        left..right
      end)

    ids = String.split(available_ids, "\n", trim: true) |> Enum.map(&String.to_integer/1)

    Enum.reduce(ids, 0, fn id, acc ->
      is_fresh = Enum.any?(fresh_ranges, fn range -> id in range end)
      if is_fresh, do: acc + 1, else: acc
    end)
  end

  @spec part2(String.t()) :: integer()
  def part2(input) do
    fresh_id_range = String.split(input, "\n", trim: true)

    fresh_ranges =
      Enum.map(fresh_id_range, fn str ->
        [left, right] =
          String.split(str, "-", trim: true)
          |> Enum.map(&String.to_integer/1)

        left..right
      end)

    Enum.flat_map(fresh_ranges, &Enum.to_list/1)
    |> Enum.into(MapSet.new())
    |> MapSet.size()
  end
end
