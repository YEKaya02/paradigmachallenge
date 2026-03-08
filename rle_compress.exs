defmodule RLECompress do
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

  # Omdat we de recursie beginnen met een count waarde van 0 en een char van nil checken we hier of count 0 is.
  # Als dat zo is voegen we het niet toe aan de lijst.
  def compress([new_char | tail], char, 0, accumaltor_list) do
    compress(tail, new_char, 1, accumaltor_list)
  end

  # Hier wordt pattern matching toegepast om te checken of char niet overeenkomt met de head, een nieuwe char dus.
  # De char en hoevaak die voorkwam wordt opgeslagen in de list en de functie wordt opnieuw geroepen.
  def compress([new_char | tail], char, count, accumaltor_list) do
    compress(tail, new_char, 1, [{char, count} | accumaltor_list])
  end
end

# Een module om naar een bestand te schrijven.
defmodule FileWriter do
  def write_to_file(text) do
    case File.write("output.txt", text) do
      :ok ->
        IO.puts("Ouput written to output.txt")

      # Hier wordt met pattern matching gekeken welke error het is en aan de hand daarvan krijgt de gebruiker nuttige output.
      {:error, :enoent} ->
        IO.puts("A component of the file name does not exist (enoent)")

      {:error, :enospc} ->
        IO.puts("There is no space left on the device (enospc)")

      {:error, :eacces} ->
        IO.puts("Missing permission for writing the file or searching one of the parent directories (eacces)")

      {:error, :eisdir} ->
        IO.puts("The named file is a directory (eisdir)")

      {:error, :enotdir} ->
        IO.puts("A component of the file name is not a directory (enotdir)")

      {:error, error} ->
        IO.puts(error)
    end
  end
end


# Hier wordt aan de hand van pattern matching een bestand ingelezen. De text uit het bestand wordt vervolgens in een array gezet.
# De compress functie wordt op die array aangeroepen. Daarna wordt de output geschreven naar een bestand.
case File.read("loremipsum.txt") do
  {:ok, contents} ->
    compressed_text = RLECompress.compress(String.graphemes(contents))
    # Omdat de resultaten steeds achter elkaar in de lijst komen moeten ze weer omgedraaid worden.
    compressed_text = Enum.reverse(compressed_text)
    # In de list staat de data als [{char, count}, {char, count}], met de map functie en een lambda zetten we dit om naar een list van strings.
    compressed_text = Enum.map(compressed_text, fn {char, count} -> "#{char}#{count}" end)
    # Zet de list om naar een string met Enum.join.
    compressed_text = Enum.join(compressed_text)

    FileWriter.write_to_file(compressed_text)

  # Hier wordt met pattern matching gekeken welke error het is en aan de hand daarvan krijgt de gebruiker nuttige output.
  {:error, :enoent} ->
    IO.puts("File does not exits (enoent)")

  {:error, :eacces} ->
    IO.puts("Missing permission for reading the file, or for searching one of the parent directories (eacces)")

  {:error, :eisdir} ->
    IO.puts("The named file is a directory (eisdir)")

  {:error, :enotdir} ->
    IO.puts("A component of the file name is not a directory (enotdir)")

  {:error, :enomem} ->
    IO.puts("There is not enough memory for the contents of the file (enomem)")

  {:error, error} ->
    IO.puts(error)
end
