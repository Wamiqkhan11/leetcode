defmodule Solution do
  @spec search(nums :: [integer], target :: integer) :: integer
  def search(nums, target) do
    helper(nums, target, 0, length(nums) - 1)
  end
  defp helper(nums, target, l, r) when l <= r do
    mid = div(l + r, 2)
    val = Enum.at(nums, mid)
    cond do
      val == target -> mid
      Enum.at(nums, l) <= val ->
        if Enum.at(nums, l) <= target and target < val,
          do: helper(nums, target, l, mid - 1),
          else: helper(nums, target, mid + 1, r)
      true ->
        if val < target and target <= Enum.at(nums, r),
          do: helper(nums, target, mid + 1, r),
          else: helper(nums, target, l, mid - 1)
    end
  end
  defp helper(_, _, _, _), do: -1
end