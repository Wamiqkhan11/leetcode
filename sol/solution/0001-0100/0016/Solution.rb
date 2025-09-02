# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
    nums.sort!
    n = nums.length
    closest_sum = nums[0] + nums[1] + nums[2]
    (0...(n-2)).each do |i|
        left = i + 1
        right = n - 1
        while left < right
            curr_sum = nums[i] + nums[left] + nums[right]
            return curr_sum if curr_sum == target
            closest_sum = curr_sum if (curr_sum - target).abs < (closest_sum - target).abs
            if curr_sum < target
                left += 1
            else
                right -= 1
            end
        end
    end
    closest_sum
end