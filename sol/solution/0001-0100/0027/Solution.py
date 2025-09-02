class Solution:
    def removeElement(self, nums: list[int], val: int) -> int:
        n, i = len(nums), 0
        while i < n:
            if nums[i] == val:
                nums[i] = nums[n - 1]
                n -= 1
            else:
                i += 1
        return n