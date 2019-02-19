defmodule Demo do
  def run(arg) do
    cond do
      arg > 2 -> IO.puts "greater!"
      arg < 2 -> IO.puts "lesser!"
      #arg == 2 -> IO.puts "equal!"
      # Fallback:
      true -> IO.puts "equal!"
    end
  end
end

Demo.run(2) |> IO.inspect
