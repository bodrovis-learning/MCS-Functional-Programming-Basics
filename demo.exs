defmodule Demo do
  def fact(n) when n < 0 or not is_integer(n) do
    "The argument #{n} is invalid!"
  end

  def fact(0), do: 1

  def fact(n) do
    n * fact(n - 1)
  end
end

Demo.fact("sdfsdfsdf") |> IO.inspect
# 1 * 2 * 3 * 4 * 5
