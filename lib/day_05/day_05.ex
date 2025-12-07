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
    fresh_id_range =
      String.split(input, "\n", trim: true)
      |> Enum.map(fn str ->
        [left, right] = String.split(str, "-", trim: true) |> Enum.map(&String.to_integer/1)

        left..right
      end)

    {time, result} =
      :timer.tc(fn ->
        merged_ranges =
          Enum.sort_by(fresh_id_range, fn start.._//_ -> start end)
          |> Enum.reduce([], fn first..last//_ = current, acc ->
            case acc do
              [] ->
                [current]

              [prev_first..prev_last//_ | rest] ->
                if prev_last >= first - 1 do
                  new_last = max(prev_last, last)
                  [prev_first..new_last | rest]
                else
                  [current | acc]
                end
            end
          end)

        Enum.reduce(merged_ranges, 0, fn range, acc ->
          Range.size(range) + acc
        end)
      end)

    IO.puts("Part 2 took #{time / 1000}ms")
    result
  end
end
