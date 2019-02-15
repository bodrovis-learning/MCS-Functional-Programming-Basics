defmodule Demo do
  def my_func(b) do
    (b + 2) |> mult |> division(2)
  end

  def mult(arg) do
    arg * 2
  end

  def division(arg, d), do: arg / d
end

Demo.my_func(3) |> IO.inspect
