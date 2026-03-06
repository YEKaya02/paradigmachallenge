# Hier wordt aan de hand van pattern matching een bestand ingelezen.
case File.read("loremisum.txt") do
  {:ok, contents} ->
    IO.puts(contents)

  {:error, reason} ->
    IO.puts(reason)
end
