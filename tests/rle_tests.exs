Code.require_file("../rle_compress.exs", __DIR__)
Code.require_file("../rle_decompress.exs", __DIR__)

ExUnit.start()

defmodule RLECompressTest do
  use ExUnit.Case

  test "compress empty list" do
    assert RLECompress.compress([]) == []
  end

  test "compress single character" do
    assert RLECompress.compress(["a"]) == [{"a", 1}]
  end

  test "compress repeated characters" do
    input = ["a","a","a"]
    assert RLECompress.compress(input) == [{"a", 3}]
  end

  test "compress multiple runs" do
    input = ["a","a","b","b","b","c"]
    result = RLECompress.compress(input)

    # Omdat de accumulator de lijst omdraait
    result = Enum.reverse(result)

    assert result == [{"a",2},{"b",3},{"c",1}]
  end

  test "compress with spaces" do
    input = ["a"," "," ","b"]
    result = RLECompress.compress(input)
    result = Enum.reverse(result)

    assert result == [{"a",1},{" ",2},{"b",1}]
  end
end


defmodule RLEDecompressTest do
  use ExUnit.Case

  test "decompress empty list" do
    assert RLEDecompress.decompress([]) == []
  end

  test "decompress single run" do
    input = ["a","3"]
    result = RLEDecompress.decompress(input) |> Enum.reverse()

    assert result == ["a","a","a"]
  end

  test "decompress multiple runs" do
    input = ["a","2","b","3"]
    result = RLEDecompress.decompress(input) |> Enum.reverse()

    assert result == ["a","a","b","b","b"]
  end

  test "decompress with spaces" do
    input = ["a","1"," ","2","b","1"]
    result = RLEDecompress.decompress(input) |> Enum.reverse()

    assert result == ["a"," "," ","b"]
  end
end
