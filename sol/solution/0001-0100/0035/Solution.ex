defmodule Solution do
  @spec search_insert(nums :: [integer], target :: integer) :: integer
  def search_insert(nums, target) do
    search(nums, target, 0, length(nums) - 1)
  end
  defp search(nums, target, left, right) when left <= right do
    mid = div(left + right, 2)
    val = Enum.at(nums, mid)
    cond do
      val == target -> mid
      val < target -> search(nums, target, mid + 1, right)
      true -> search(nums, target, left, mid - 1)
    end
  end
  defp search(_nums, _target, left, _right), do: left
end