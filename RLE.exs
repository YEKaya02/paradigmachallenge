defmodule RLE do
  # Start functie, hier wordt pattern matching gebruikt om te kijken of de input alleen een list is.
  def compress(list) do
    # Zet de initieele waarde, roept de functie recursief aan.
    compress(list, nil, 0, [])
  end

  # Stop conditie, lijst is leeg alles is verwerkt.
  def compress([], nil, 0, accumaltor_list) do
    accumaltor_list
  end

  # Stop conditie, lijst is leeg maar de laatste char is nog niet toegevoegd aan de list.
  def compress([], char, count, accumaltor_list) do
    [{char, count} | accumaltor_list]
  end

  # Hier wordt pattern matching toegepast om te checken of het eerste element van de list overeenkomt met de vorige char.
  # Als dat zo is wordt de functie opnieuw geroepen en count wordt met 1 verhoogd.
  def compress([char | tail], char, count, accumaltor_list) do
    compress(tail, char, count + 1, accumaltor_list)
  end

  # Hier wordt pattern matching toegepast om te checken of char niet overeenkomt met de head, een nieuwe char dus.
  # De char en hoevaak die voorkwam wordt opgeslagen in de list en de functie wordt opnieuw geroepen.
  def compress([new_char | tail], char, count, accumaltor_list) do
    compress(tail, new_char, 1, [{char, count} | accumaltor_list])
  end
end

# Hier wordt aan de hand van pattern matching een bestand ingelezen. De text uit het bestand wordt vervolgens in een array gezet.
case File.read("loremipsum.txt") do
  {:ok, contents} ->
    compressed_text = RLE.compress(String.graphemes(contents))
    IO.inspect(compressed_text)


  {:error, error} ->
    IO.puts(error)
end
