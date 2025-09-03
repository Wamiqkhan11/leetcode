# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
    i = nums.length - 2
    i -= 1 while i >= 0 && nums[i] >= nums[i + 1]
    if i >= 0
        j = nums.length - 1
        j -= 1 while nums[j] <= nums[i]
        nums[i], nums[j] = nums[j], nums[i]
    end
    nums[i+1..-1] = nums[i+1..-1].reverse
end