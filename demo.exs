defmodule Demo do
  def work(i) do
    spawn(fn ->
      fact(10) |> IO.inspect(label: "#{i} Result is")
    end) |> IO.inspect
  end

  def run do
    Enum.each 1..5, &( work(&1) )
  end

  def fact(n) do
    :timer.sleep 5000
    do_fact(1, n)
  end
  defp do_fact(result, n) when n < 1, do: result
  defp do_fact(result, n) do
    result * n |> do_fact(n - 1)
  end
end

Demo.run |> IO.inspect
IO.puts "Doing some other work...."
