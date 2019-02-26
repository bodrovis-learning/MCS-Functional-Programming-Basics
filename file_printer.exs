defmodule Demo do
  def run(filename) do
    File.stream!(filename) |>
    Stream.with_index |>
    Enum.each(&print_line/1)
  end

  defp print_line({contents, line_num}) do
    :timer.sleep 100
    "#{line_num} \t #{contents}" |> by_char
  end

  defp by_char(str) do
    str |>
    String.split("") |>
    Enum.each(&print_by_char/1)
  end

  defp print_by_char(char) do
    :timer.sleep 50
    char |> IO.write
  end
end

Demo.run "file_printer.exs"
