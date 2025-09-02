defmodule Solution do
  @spec three_sum_closest(nums :: [integer], target :: integer) :: integer
  def three_sum_closest(nums, target) do
    nums = List.to_tuple(Enum.sort(nums))
    len = tuple_size(nums)
    cond do
      target > 3000 -> elem(nums, len - 1) + elem(nums, len - 2) + elem(nums, len - 3)
      target < -3000 -> elem(nums, 0) + elem(nums, 1) + elem(nums, 2)
      target > 0 -> do_three_sum_closest(nums, 0, len, target, -3000)
      true -> do_three_sum_closest(nums, 0, len, target, 3000)
    end
  end
  defp do_three_sum_closest(_nums, _i, _len, target, target), do: target
  defp do_three_sum_closest(_nums, i, len, _target, closest) when i > len - 3, do: closest
  defp do_three_sum_closest(nums, i, len, target, closest) do
    if i == 0 or elem(nums, i - 1) != elem(nums, i) do
      closest = find_closest(nums, i, i + 1, len - 1, target, closest)
      do_three_sum_closest(nums, i + 1, len, target, closest)
    else
      do_three_sum_closest(nums, i + 1, len, target, closest)
    end
  end
  defp find_closest(_nums, _i, l, r, _target, closest) when l >= r, do: closest
  defp find_closest(nums, i, l, r, target, closest) do
    val_i = elem(nums, i)
    val_l = elem(nums, l)
    val_r = elem(nums, r)
    sum = val_i + val_l + val_r
    cond do
      sum == target ->
        sum
      target > sum ->
        new_closest = update_closest(target, closest, sum)
        new_l = grow_from_left(nums, l + 1, r, val_l)
        find_closest(nums, i, new_l, r, target, new_closest)
      true ->
        new_closest = update_closest(target, closest, sum)
        new_r = shrink_from_right(nums, l, r - 1, val_r)
        find_closest(nums, i, l, new_r, target, new_closest)
    end
  end
  defp update_closest(target, current, new) do
    if abs(target - new) < abs(target - current) do
      new
    else
      current
    end
  end
  defp shrink_from_right(nums, l, r, prev_val_r) do
    cond do
      r <= l or elem(nums, r) != prev_val_r -> r
      true -> shrink_from_right(nums, l, r - 1, prev_val_r)
    end
  end
  defp grow_from_left(nums, l, r, prev_val_l) do
    cond do
      l >= r or elem(nums, l) != prev_val_l -> l
      true -> grow_from_left(nums, l + 1, r, prev_val_l)
    end
  end
end