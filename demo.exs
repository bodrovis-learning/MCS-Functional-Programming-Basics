defmodule Worker do
  def work do
    IO.puts "worker..."
    receive do
      {:add, a, b, sender} -> send sender, a + b
      _ -> IO.puts "Not sure how to process this message..."
    end
    IO.puts "ending worker..."
  end
end

defmodule Demo do
  def run do
    pid = spawn Worker, :work, []
    send pid, {:add, 1, 2, self()}

    response = receive do
      response -> response
    end

    IO.puts "Response is #{response}"

    send pid, {:add, 1, 2, self()}

    response = receive do
      response -> response
    after 5000 -> IO.puts "No response :("
    end
  end
end

Demo.run
