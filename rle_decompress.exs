# Hier wordt aan de hand van pattern matching een bestand ingelezen. De text uit het bestand wordt vervolgens in een array gezet.

case File.read("output.txt") do
  {:ok, contents} ->
    IO.puts(contents)

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
