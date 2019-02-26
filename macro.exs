defmodule MyModule do
  defmacro unless(condition, clauses) do
    false_clause = Keyword.get clauses, :do, nil
    true_clause = Keyword.get clauses, :else, nil
    quote do
      if unquote(condition) do
        unquote(true_clause)
      else
        unquote(false_clause)
      end
    end
  end
end

defmodule Demo do
  require MyModule

  def run do
    MyModule.unless true do
      IO.puts "THE CONDITION IS FALSE! 1 + 1  is not 2"
    else
      IO.puts "THE CONDITION IS TRUE! 1 + 1 is 2"
    end
  end
end

Demo.run
