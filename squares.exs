defmodule MyModule do
  def calculate_squares(collection) do
    for number <- collection, is_number(number), into: Map.new,
    do: {number, :math.sqrt(number)}
  end
end

squares = MyModule.calculate_squares( [1,2,3,"test",4] )
squares |> IO.inspect
squares[3] |> IO.inspect # => 1.7320508075688772
