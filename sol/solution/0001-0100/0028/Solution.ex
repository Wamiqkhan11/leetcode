defmodule Solution do
  @spec str_str(haystack :: String.t(), needle :: String.t()) :: integer
  def str_str(haystack, needle) do
    cond do
      needle == "" ->
        0
      true ->
        case :binary.match(haystack, needle) do
          :nomatch -> -1
          {pos, _len} -> pos
        end
    end
  end
end
