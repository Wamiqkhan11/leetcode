defmodule Solution do
  @spec generate_parenthesis(n :: integer) :: [String.t]
  def generate_parenthesis(n) do
    generate([], "", 0, 0, n)
  end
  defp generate(acc, curr, open, close, n) do
    if String.length(curr) == n * 2 do
      [curr | acc]
    else
      acc =
        if open < n do
          generate(acc, curr <> "(", open + 1, close, n)
        else
          acc
        end
      if close < open do
        generate(acc, curr <> ")", open, close + 1, n)
      else
        acc
      end
    end
  end
end