{max, _} = Integer.parse(IO.gets("Enter max: "))

guessed_num = :rand.uniform(max)
guessed_num |> IO.puts # debug

{^guessed_num, _} = Integer.parse(IO.gets("Guess! "))

IO.inspect "You guessed! #{guessed_num}"
