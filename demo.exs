defmodule DemoMacro do
  defmacro my_macro(number) do
    quote do
      unquote(number) * 10
    end
  end

  defmacro m_time(time) do
    quote bind_quoted: [time: time] do
      time |> IO.inspect
      :timer.sleep 2000
      time |> IO.inspect
    end
  end

  defmacro m_palindrome?(str, true_clause) do
    quote bind_quoted: [str: str, true_clause: true_clause] do
      if str == String.reverse(str), do: true_clause
    end
  end

  def palindrome?(str, true_clause) do
    if str == String.reverse(str), do: true_clause
  end
end

defmodule Demo do
  require DemoMacro

  def run do
    DemoMacro.m_time :os.system_time
    #DemoMacro.m_palindrome?("kabak", IO.puts("YES!")) |> IO.inspect # :ok
    #DemoMacro.my_macro(2) |> IO.inspect
  end
end

Demo.run
