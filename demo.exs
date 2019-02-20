defmodule Demo do
  def fact(n), do: do_fact 1, n

  defp do_fact(total, n) when n < 1, do: total
  defp do_fact(total, n) do
    total * n |> do_fact(n - 1)
  end

  def mult(list), do: do_mult(1, list)

  defp do_mult(result, []), do: result
  defp do_mult(result, [head | tail]) do
    result * head |> do_mult(tail)
  end
end

#Demo.fact(100) |> IO.inspect
Demo.mult([1,2,3,4]) |> IO.inspect
