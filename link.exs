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
    Process.flag :trap_exit, true
    pid = spawn_link Worker, :work, []
    send pid, {:div, 2, 0}

    receive do
      response -> response
      {:EXIT, pid, code} -> IO.puts "Process #{pid} exited with code #{code}"
    after 5000 -> IO.puts "timeout"
    end

    IO.puts "Doing other stuff..."
  end
end

Demo.run
