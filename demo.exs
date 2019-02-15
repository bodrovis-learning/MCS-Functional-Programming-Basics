defmodule Demo do
  def division(arg), do: division(arg, 2) # /1

  def division(_arg, 0) do
    "Infinity"
  end

  def division(arg, d) do # /2
    arg / d
  end
end

Demo.division(4, 0) |> IO.inspect
