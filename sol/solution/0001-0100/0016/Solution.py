class Solution:
    def threeSumClosest(self, nums: List[int], target: int) -> int:
        nums.sort()
        n = len(nums)
        closest_sum = nums[0] + nums[1] + nums[2]
        for i in range(n - 2):
            left, right = i + 1, n - 1
            while left < right:
                curr_sum = nums[i] + nums[left] + nums[right]
                if curr_sum == target:
                    return curr_sum
                if abs(curr_sum - target) < abs(closest_sum - target):
                    closest_sum = curr_sum
                if curr_sum < target:
                    left += 1
                else:
                    right -= 1
        return closest_sum