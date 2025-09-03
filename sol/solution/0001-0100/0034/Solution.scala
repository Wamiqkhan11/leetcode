object Solution {
    def searchRange(nums: Array[Int], target: Int): Array[Int] = {
        def findBound(first: Boolean): Int = {
            var l = 0
            var r = nums.length - 1
            var ans = -1
            while (l <= r) {
                val mid = (l + r) / 2
                if (nums(mid) == target) {
                    ans = mid
                    if (first) r = mid - 1 else l = mid + 1
                } else if (nums(mid) < target) l = mid + 1
                else r = mid - 1
            }
            ans
        }
        Array(findBound(true), findBound(false))
    }
}