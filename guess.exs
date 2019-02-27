defmodule Guesser.Server do
  def start(max_random) do
    spawn(fn -> loop({ :player_1, set_random(max_random) }) end) |>
    Process.register(:guesser_server)
  end

  defp loop({nil, _}), do: exit(:normal)
  defp loop(current_state) do
    new_state = receive do
      {:current_player, sender} ->
        current_state |> send_current_player(sender)
      {:answer, user_number, sender} ->
        current_state |> compare(user_number, sender)
      _ -> current_state
    end

    new_state |> loop
  end

  defp send_current_player({current_player, _} = current_state, sender) do
    send sender, {:ok, current_player}
    current_state
  end

  defp compare({current_player, correct_answer}, correct_answer, sender) do
    send sender, {:winner, current_player}
    {nil, correct_answer}
  end
  defp compare({current_player, correct_answer}, _incorrect_answer, sender) do
    send sender, :incorrect
    {next_player(current_player), correct_answer}
  end

  defp set_random(maximum) when maximum < 0 or not is_integer(maximum), do: 10 |> set_random
  defp set_random(maximum), do: :rand.uniform(maximum)

  defp next_player(:player_1), do: :player_2
  defp next_player(:player_2), do: :player_1
end

defmodule Guesser.Client do
  def play do
    get_maximum() |>
    Guesser.Server.start

    next_turn()
  end

  defp next_turn do
    send :guesser_server, {:current_player, self()}
    receive do
      {:ok, current_player} -> IO.puts "\n== #{current_player}, it's your turn! =="
    after 5000 ->
      IO.puts "Server timeout"
      exit :error
    end

    ask_guess()
  end

  defp ask_guess do
    send( :guesser_server,
    {:answer, gets_and_parse("Enter your guess (integer): "), self()} )

    receive do
      :incorrect ->
        IO.puts "Incorrect!"
        next_turn()
      {:winner, current_player} ->
        IO.puts "#{current_player} wins!"
        exit(:normal)
    after 5000 ->
      IO.puts "Server timeout"
      exit :error
    end
  end

  defp get_maximum do
    max = gets_and_parse("Enter maximum (integer, greater than 0): ")
    case is_integer(max) and max > 0 do
      true -> max
      _ -> get_maximum()
    end
  end

  defp gets_and_parse(msg) do
    case Integer.parse(IO.gets(msg)) do
      :error -> :error
      {int, _} -> int
      _ -> :error
    end
  end
end

Guesser.Client.play
