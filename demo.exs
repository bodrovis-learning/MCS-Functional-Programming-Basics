defmodule Demo do
  def run do
    1..10000000 |>
    Stream.map( &(&1 * 2) ) |>
    Stream.with_index |>
    #Enum.take(3)
    Enum.to_list
  end
end

Demo.run |> IO.inspect
