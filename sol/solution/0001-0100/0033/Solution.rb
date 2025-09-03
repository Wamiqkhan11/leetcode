# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  l, r = 0, nums.length - 1
  while l <= r
    mid = (l + r) / 2
    return mid if nums[mid] == target
    if nums[l] <= nums[mid]
      if nums[l] <= target && target < nums[mid]
        r = mid - 1
      else
        l = mid + 1
      end
    else
      if nums[mid] < target && target <= nums[r]
        l = mid + 1
      else
        r = mid - 1
      end
    end
  end
  -1
end