defmodule RLEDecompress do
  # Start functie, list met gecomrimeerde data komt binnen en de functie wordt recursief aangeroepen.
  def decompress(list) do
    decompress(list, [])
  end

  # Stop functie, de list is leeg dus kan de gedecomprimeerde data gereturned worden.
  defp decompress([], accumaltor), do: accumaltor

  # Hier wordt pattern matching toegepast om telkens een char en een count uit de list te halen.
  # De count wordt omgezet naar een integer, waarna de char met List.duplicate meerdere keren
  # wordt herhaald. Deze herhaalde chars worden toegevoegd aan de accumulator en de functie
  # wordt opnieuw recursief aangeroepen met de rest van de list
  defp decompress([char, count | tail], accumaltor) do
    {num, ""} = Integer.parse(count)
    repeated = List.duplicate(char, num)
    decompress(tail, repeated ++ accumaltor)
  end
end

# Hier wordt aan de hand van pattern matching een bestand ingelezen. De text uit het bestand wordt vervolgens in een array gezet.
case File.read("output.txt") do
  {:ok, contents} ->
    IO.inspect(RLEDecompress.decompress(String.graphemes(contents)))

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
