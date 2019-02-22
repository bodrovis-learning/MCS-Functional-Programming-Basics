defmodule Todo.Server do
  def start do
    spawn(__MODULE__, :listen, [ [] ]) |>
    Process.register(:todo_server)
  end

  def listen(todos) do
    new_todos = receive do
      {:add, date, body} -> [ {date, body} | todos]
      {:get, sender} ->
        send sender, todos
        todos
    end

    new_todos |> listen
  end
end

defmodule Todo.Client do
  def start do
    Todo.Server.start
  end

  def get do
    send :todo_server, {:get, self()}

    receive do
      response -> response
    after 5000 -> IO.puts "Server timeout!"
    end
  end

  def add(date, body) do
    send :todo_server, {:add, date, body}
  end
end

Todo.Client.start
Todo.Client.add ~D[2019-02-22], "Some todo"
Todo.Client.add ~D[2019-02-25], "Another todo"
Todo.Client.get |> IO.inspect
