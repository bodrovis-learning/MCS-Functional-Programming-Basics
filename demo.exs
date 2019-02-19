defmodule Demo do
  def run(filename) do
    printer = fn(str) ->
      :timer.sleep 500
      str |> IO.puts
    end

    case File.read(filename) do
      {:ok, content} ->
        content |> String.split("\n") |> Enum.each(printer)
      {:error, reason} -> IO.puts "Error! #{reason}"
    end
  end
end

Demo.run("demo.exs") |> IO.inspect
