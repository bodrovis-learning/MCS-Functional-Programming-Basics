# Модифицировать построчную печать файла (из урока 6-7) таким образом,
# что с задержкой в полсекунды появляются не только строки,
# но и отдельные символы в строке.
# То есть реализовать эффект, напоминающий печатную машинку.

defmodule Demo do
  def run(filename) do
    printer = fn({contents, line_num}) ->
      :timer.sleep 500
      IO.puts "#{line_num} \t #{contents}"
    end

    File.stream!(filename) |>
    Stream.map(&( String.replace(&1, "\n", "") )) |>
    Stream.with_index |>
    Enum.each(printer)
  end
end

Demo.run "demo.exs"
