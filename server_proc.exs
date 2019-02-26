defmodule Calculator.Server do
  def start(initial_state \\ 0) do
    spawn(fn -> loop(initial_state) end) |>
    Process.register(:calculator)
  end

  defp loop(current_value) do
    new_value = receive do
      message -> process_message(current_value, message)
    end
    new_value |> loop
  end

  defp process_message(current_value, {:value, caller}) do
    send(caller, {:response, current_value})
    current_value
  end
  defp process_message(current_value, {:add, value}), do: current_value + value
  defp process_message(current_value, {:sub, value}), do: current_value - value
  defp process_message(current_value, {:mul, value}), do: current_value * value
  defp process_message(current_value, {:div, value}), do: current_value / value
  defp process_message(current_value, :sqr), do: :math.sqrt(current_value)
end

defmodule Calculator.Client do
  def add(value), do: do_send({:add, value})
  def sub(value), do: do_send({:sub, value})
  def mul(value), do: do_send({:mul, value})
  def div(value), do: do_send({:div, value})
  def sqr, do: do_send(:sqr)
  def value do
    {:value, self()} |> do_send
    receive do
      {:response, value} -> value
      _ -> :error
    after 5000 -> IO.puts "Timeout!"
    end
  end

  defp do_send(msg), do: send(:calculator, msg)
end

Calculator.Server.start(1)
Calculator.Client.value |> IO.puts
Calculator.Client.add(10)
Calculator.Client.sub(5)
Calculator.Client.mul(3)
Calculator.Client.div(5)
Calculator.Client.sqr
Calculator.Client.value |> IO.puts
