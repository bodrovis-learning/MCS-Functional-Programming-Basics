defmodule Worker do
  def work do
    IO.puts "worker..."

    receive do
      {:div, a, b} -> do_div(a, b)
    end
  end

  defp do_div(_a, 0), do: exit(:error)
  defp do_div(a, b), do: a / b
end

defmodule Demo do
  def run do
    {pid, _} = spawn_monitor Worker, :work, []
    #Process.monitor pid
    send pid, {:div, 2, 0}

    receive do
      {:DOWN, _, _, _, _} -> IO.puts "process down...."
      response -> response |> IO.inspect
    after 5000 -> IO.puts "timeout"
    end

    IO.puts "Doing other stuff..."
  end
end

Demo.run
