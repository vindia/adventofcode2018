defmodule TotalFrequency do
  @moduledoc false

  def calculate(input_file) do
    input_file
    |> read_file_as_list
    |> sum
  end

  def sum(inputs) do
    Enum.reduce(inputs, 0, fn x, acc -> x + acc end)
  end

  defp read_file_as_list(path_to_file) do
    path_to_file
    |> File.read!
    |> String.split("\n")
    |> Enum.reject(fn(s) -> s == "" end)
    |> Enum.map(fn(x) -> String.to_integer(x) end)
  end
end

IO.puts TotalFrequency.calculate("./input")
