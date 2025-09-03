# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  find_bound = ->(first) {
    l, r, ans = 0, nums.length - 1, -1
    while l <= r
      mid = (l + r) / 2
      if nums[mid] == target
        ans = mid
        if first
          r = mid - 1
        else
          l = mid + 1
        end
      elsif nums[mid] < target
        l = mid + 1
      else
        r = mid - 1
      end
    end
    ans
  }
  [find_bound.call(true), find_bound.call(false)]
end