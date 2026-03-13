Code.require_file("rle_compress.exs", __DIR__)

# Hier wordt aan de hand van pattern matching een bestand ingelezen. De text uit het bestand wordt vervolgens in een array gezet.
# De compress functie wordt op die array aangeroepen. Daarna wordt de output geschreven naar een bestand.
case File.read("input.txt") do
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
