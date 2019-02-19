defmodule Demo do
  def run(list) do
    printer = fn
      {name, number} -> # body 1
        "#{name} is #{number}" |> IO.puts
      str -> # body 2
        str |> IO.inspect
      _ -> # fallback
        IO.inspect "fallback!"
    end

    #Enum.each list, fn(str) -> str |> IO.inspect end
    Enum.each list, printer
  end
end

Demo.run [1,2,3,4,5]
Demo.run [{:a, 1}, {:b, 2}, {:c, 3}, {:d, 4}, {:e, 5}]
