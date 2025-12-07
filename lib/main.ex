defmodule Main do
  def main(path) do
    case File.read(path) do
      {:ok, content} ->
        IO.puts(Day04.part1(content))

      {:error, reason} ->
        IO.puts("Error: #{reason}")
    end
  end
end
