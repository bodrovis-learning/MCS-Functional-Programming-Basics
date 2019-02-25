defmodule Demo do
  def span(from, to) when not is_integer(from) or not is_integer(to), do: []
  def span(from, to) when from > to, do: span(to, from)
  def span(from, to) when from == to, do: [to]
  def span(from, to) do
    [from | span(from + 1, to)]
  end

  def max([ value, head | tail ]) when not is_integer(value) do
    max([ head | tail ])
  end
  # [20,5]
  def max([ value, head | tail ]) when value < head do
    max([ head | tail ])
  end

  def max([ value, head | tail ]) when value >= head do
    max([ value | tail ])
  end

  def max([ value ]) when not is_integer(value), do: nil
  def max([ value ]), do: value

  def all?(list), do: all?(list, &( !!&1 )) # !! converts truthy to `true`
  def all?([], _fun), do: true
  def all?([ head | tail ], fun) do
    if fun.(head) do
      all?(tail, fun)
    else
      false
    end
  end
end

#Demo.span(1, 10) |> IO.inspect(label: "SPAN")

#Demo.max([1,"test",20,5]) |> IO.inspect(label: "MAX")

#Demo.all?([1,2,5,3], &( &1 > 0 )) |> IO.inspect(label: "ALL 2")

Demo.all?([1,nil,5,2]) |> IO.inspect(label: "ALL 1")
