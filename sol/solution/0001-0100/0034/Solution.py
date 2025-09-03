class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        def findBound(first: bool) -> int:
            l, r, ans = 0, len(nums) - 1, -1
            while l <= r:
                mid = (l + r) // 2
                if nums[mid] == target:
                    ans = mid
                    if first:
                        r = mid - 1
                    else:
                        l = mid + 1
                elif nums[mid] < target:
                    l = mid + 1
                else:
                    r = mid - 1
            return ans
        return [findBound(True), findBound(False)]