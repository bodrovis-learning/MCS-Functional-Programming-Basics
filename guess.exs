defmodule Game do
  def start do
    get_maximum() |>
    set_random |>
    ask_guess
  end

  defp ask_guess(correct_answer) do
    IO.puts "I set #{correct_answer}"
    correct_answer |>
    compare(gets_and_parse("Enter your guess (integer): "))
  end

  defp compare(correct_answer, correct_answer) do
    IO.puts "#{correct_answer} is correct. You won!"
  end

  defp compare(correct_answer, _incorrect_answer) do
    IO.puts "Incorrect. Try again!"
    correct_answer |> ask_guess
  end

  defp get_maximum, do: gets_and_parse("Enter maximum (integer): ")

  defp set_random(maximum) when maximum < 0 or not is_integer(maximum), do: 10 |> set_random
  defp set_random(maximum), do: :rand.uniform(maximum)

  defp gets_and_parse(msg) do
    case Integer.parse(IO.gets(msg)) do
      :error -> :error
      {int, _} -> int
      _ -> :error
    end
  end
end

Game.start
