defmodule Main do
  def main(path) do
    case File.read(path) do
      {:ok, content} ->
        IO.puts(Day05.part2(content))

      {:error, reason} ->
        IO.puts("Error: #{reason}")
    end
  end
end
