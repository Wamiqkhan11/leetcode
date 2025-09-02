defmodule Solution do
  @spec letter_combinations(digits :: String.t) :: [String.t]
  def letter_combinations("") do
    []
  end
  def letter_combinations(digits) do
    mapping = %{
      "2" => ["a", "b", "c"],
      "3" => ["d", "e", "f"],
      "4" => ["g", "h", "i"],
      "5" => ["j", "k", "l"],
      "6" => ["m", "n", "o"],
      "7" => ["p", "q", "r", "s"],
      "8" => ["t", "u", "v"],
      "9" => ["w", "x", "y", "z"]
    }
    digits
    |> String.graphemes()
    |> Enum.map(&Map.get(mapping, &1, []))
    |> Enum.reduce([""], fn letters, acc ->
      for prefix <- acc, letter <- letters, do: prefix <> letter
    end)
  end
end