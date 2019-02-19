defmodule Demo do
  def run(list) do
    # capture operator
    Enum.each list, &IO.inspect/1
    # &( IO.inspect(&1 * &1) )
    # fn(str) -> str |> IO.inspect end
  end
end

Demo.run [1,2,3,4,5]
