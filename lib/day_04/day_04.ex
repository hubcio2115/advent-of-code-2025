defmodule Day04 do
  @spec part1(String.t()) :: integer()
  def part1(input) do
    lines = String.split(input, "\n", trim: true)
    lines_count = length(lines)

    Enum.with_index(lines)
    |> Enum.reduce(0, fn {line, line_idx}, acc ->
      line_length = String.length(line)

      chars =
        String.split(line, "", trim: true)

      clearable_rolls =
        Enum.with_index(chars)
        |> Enum.reduce(0, fn {char, idx}, acc ->
          if char != "@" do
            acc
          else
            x_range = max(idx - 1, 0)..min(idx + 1, line_length)
            y_range = max(line_idx - 1, 0)..min(line_idx + 1, lines_count)

            roll_count =
              Enum.slice(lines, y_range)
              |> Enum.reduce(0, fn line, acc ->
                count = String.slice(line, x_range) |> String.count("@")
                acc + count
              end)

            if roll_count <= 4, do: acc + 1, else: acc
          end
        end)

      acc + clearable_rolls
    end)
  end
end
