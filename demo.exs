defmodule DemoMacro do
  defmacro my_macro(number) do
    quote do
      unquote(number) * 10
    end
  end

  defmacro m_palindrome?(str, true_clause) do
    quote do
      if unquote(str) == String.reverse(unquote(str)), do: unquote(true_clause)
    end
  end

  def palindrome?(str, true_clause) do
    if str == String.reverse(str), do: true_clause
  end
end

defmodule Demo do
  require DemoMacro

  def run do
    DemoMacro.m_palindrome?("kabak", IO.puts("YES!")) |> IO.inspect # :ok
    #DemoMacro.my_macro(2) |> IO.inspect
  end
end

Demo.run
