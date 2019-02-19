defmodule Demo do
  def run(arg) do
    if arg > 3 do
      arg = arg * 2
      arg + 2
    #else
    #  arg = arg / 2
    #  arg + 10
    end

    if arg > 3, do: arg + 2 #, else: arg + 10
  end
end

Demo.run(2) |> IO.inspect
