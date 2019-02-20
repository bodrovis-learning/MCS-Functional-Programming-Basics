defmodule Demo do
  require Integer

  def run do
    for {name, salary} <- [ {:joe, 1000}, {:ann, 500} ], y <- 1..10, #x < y, Integer.is_even(y),
    into: %{} do
      { name, salary * y}
    end
  end
end

#mult = Demo.run
#mult[{5,6}] |> IO.inspect
Demo.run  |> IO.inspect
