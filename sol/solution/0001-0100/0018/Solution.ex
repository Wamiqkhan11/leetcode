defmodule Solution do
  @spec four_sum(nums :: [integer], target :: integer) :: [[integer]]
  def four_sum([], _target), do: []
  def four_sum([_], _target), do: []
  def four_sum([_, _], _target), do: []
  def four_sum([_, _, _], _target), do: []
  def four_sum([a, b, c, d], target) do
    if a + b + c + d == target do
      [[a, b, c, d]]
    else
      []
    end
  end
  def four_sum(nums, target) do
    nums =
      nums
      |> Enum.sort()
      |> List.to_tuple()
    len = tuple_size(nums)
    do_four_sum(nums, len, target, 0, [])
  end
  defp do_four_sum(nums, len, target, i, acc) do
    val_i = elem(nums, i)
    cond do
      (val_i > 0 and val_i > target) or i > len - 4 ->
        acc
      i == 0 or elem(nums, i - 1) != val_i ->
        triplets = do_three_sum(nums, len, target - val_i, i + 1, i + 1, [])
        acc = Enum.reduce(triplets, acc, fn triplet, acc -> [[val_i | triplet] | acc] end)
        do_four_sum(nums, len, target, i + 1, acc)
      true ->
        do_four_sum(nums, len, target, i + 1, acc)
    end
  end
  defp do_three_sum(nums, len, target, i, start_i, acc) do
    val_i = elem(nums, i)
    cond do
      (val_i > 0 and val_i > target) or i > len - 3 ->
        acc
      i == start_i or elem(nums, i - 1) != val_i ->
        acc = find_triplets(nums, target, i, i + 1, len - 1, acc)
        do_three_sum(nums, len, target, i + 1, start_i, acc)
      true ->
        do_three_sum(nums, len, target, i + 1, start_i, acc)
    end
  end
  defp find_triplets(_nums, _target, _i, l, r, acc) when l >= r, do: acc
  defp find_triplets(nums, target, i, l, r, acc) do
    val_i = elem(nums, i)
    val_l = elem(nums, l)
    val_r = elem(nums, r)
    sum = val_i + val_l + val_r
    cond do
      sum > target ->
        find_triplets(nums, target, i, l, r - 1, acc)
      sum < target ->
        find_triplets(nums, target, i, l + 1, r, acc)
      true ->
        acc = [[val_i, val_l, val_r] | acc]
        l = grow_from_left(nums, l + 1, r, val_l)
        r = shrink_from_right(nums, l, r - 1, val_r)
        find_triplets(nums, target, i, l, r, acc)
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