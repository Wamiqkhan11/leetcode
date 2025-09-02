# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
  n = nums.length
  i = 0
  while i < n
    if nums[i] == val
      nums[i] = nums[n - 1]
      n -= 1
    else
      i += 1
    end
  end
  n
end