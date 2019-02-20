defmodule Demo do
  def traverse([]), do: :ok
  def traverse([head | tail]) do
    head |> IO.inspect

    tail |> traverse
  end

  def map([], _fun), do: []

  def map([head | tail], fun) do
    [ fun.(head) | map(tail, fun) ]
    # [ 1 * 2 | [ 2 * 2 | [ 3 * 2 ] | [] ] ]
  end

  def mult([]), do: 1

  def mult([head | tail]) do
    head * mult(tail)
  end
end

#Demo.traverse([1,2,3,4,5]) |> IO.inspect
#Demo.map([1,2,3,4,5], &( &1 * 2 )) |> IO.inspect
Demo.mult([1,2,3,4,5]) |> IO.inspect
