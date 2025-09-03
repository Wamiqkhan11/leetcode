defmodule Solution do
  @spec longest_valid_parentheses(String.t()) :: integer
  def longest_valid_parentheses(s) do
    lr = pass_lr(s)
    rl = pass_rl(s)
    max(lr, rl)
  end
  defp pass_lr(s) do
    s
    |> String.graphemes()
    |> Enum.reduce({0, 0, 0}, fn ch, {left, right, best} ->
      {l, r} = if ch == "(", do: {left + 1, right}, else: {left, right + 1}
      cond do
        l == r -> {l, r, max(best, 2 * r)}
        r > l  -> {0, 0, best}
        true   -> {l, r, best}
      end
    end)
    |> elem(2)
  end
  defp pass_rl(s) do
    s
    |> String.graphemes()
    |> Enum.reverse()
    |> Enum.reduce({0, 0, 0}, fn ch, {left, right, best} ->
      {l, r} = if ch == ")", do: {left, right + 1}, else: {left + 1, right}
      cond do
        l == r -> {l, r, max(best, 2 * l)}
        l > r  -> {0, 0, best}
        true   -> {l, r, best}
      end
    end)
    |> elem(2)
  end
end