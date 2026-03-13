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
