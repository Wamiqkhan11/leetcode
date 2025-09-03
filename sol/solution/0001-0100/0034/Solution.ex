defmodule Solution do
  @spec search_range(nums :: [integer], target :: integer) :: [integer]
  def search_range(nums, target) do
    [find_bound(nums, target, true), find_bound(nums, target, false)]
  end
  defp find_bound(nums, target, first) do
    helper(nums, target, 0, length(nums) - 1, -1, first)
  end
  defp helper(nums, target, l, r, ans, first) when l <= r do
    mid = div(l + r, 2)
    val = Enum.at(nums, mid)
    cond do
      val == target ->
        if first,
          do: helper(nums, target, l, mid - 1, mid, first),
          else: helper(nums, target, mid + 1, r, mid, first)
      val < target -> helper(nums, target, mid + 1, r, ans, first)
      true -> helper(nums, target, l, mid - 1, ans, first)
    end
  end
  defp helper(_, _, _, _, ans, _), do: ans
end