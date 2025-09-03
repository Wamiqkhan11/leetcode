class Solution {
    fun searchRange(nums: IntArray, target: Int): IntArray {
        fun findBound(first: Boolean): Int {
            var l = 0; var r = nums.size - 1; var ans = -1
            while (l <= r) {
                val mid = (l + r) / 2
                if (nums[mid] == target) {
                    ans = mid
                    if (first) r = mid - 1 else l = mid + 1
                } else if (nums[mid] < target) l = mid + 1
                else r = mid - 1
            }
            return ans
        }
        return intArrayOf(findBound(true), findBound(false))
    }
}