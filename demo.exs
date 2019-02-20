defmodule Demo do
  def run(filename) do
    printer = fn({contents, line_num}) ->
      :timer.sleep 500
      IO.puts "#{line_num} \t #{contents}"
    end

    #File.open!(filename) |>
    #IO.stream(:line) |>
    File.stream!(filename) |>
    Stream.map(&( String.replace(&1, "\n", "") )) |>
    Stream.with_index |>
    Enum.each(printer)
  end
end

Demo.run "demo.exs"
