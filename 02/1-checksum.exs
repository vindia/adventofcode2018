defmodule Checksum do
  @moduledoc false

  def get_checksum_for(input_file) do
    input_file
    |> read_file_as_list
    |> get_checksum
  end

  def get_checksum(box_ids) do
    box_ids
    |> Enum.flat_map(fn(box_id) -> find_repetitions(box_id) end)
    |> Enum.group_by(fn(x) -> x end)
    |> Enum.map(fn({_, v}) -> length(v) end)
    |> Enum.reduce(1, fn(x, product) -> product * x end) 
  end

  defp find_repetitions(box_id) do
    box_id
    |> String.graphemes
    |> Enum.group_by(fn(x) -> x end)
    |> Enum.map(fn({_, v}) -> length(v) end)
    |> Enum.filter(fn(x) -> x > 1 end)
    |> Enum.uniq()
  end

  defp read_file_as_list(path_to_file) do
    path_to_file
    |> File.read!
    |> String.split("\n")
    |> Enum.reject(fn(s) -> s == "" end)
  end
end

IO.inspect Checksum.get_checksum_for("./input")
