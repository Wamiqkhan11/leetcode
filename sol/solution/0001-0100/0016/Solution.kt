class Solution {
    fun threeSumClosest(nums: IntArray, target: Int): Int {
        nums.sort()
        val n = nums.size
        var closestSum = nums[0] + nums[1] + nums[2]
        for (i in 0 until n - 2) {
            var left = i + 1
            var right = n - 1
            while (left < right) {
                val currSum = nums[i] + nums[left] + nums[right]
                if (currSum == target) return currSum
                if (kotlin.math.abs(currSum - target) < kotlin.math.abs(closestSum - target)) {
                    closestSum = currSum
                }
                if (currSum < target) left++
                else right--
            }
        }
        return closestSum
    }
}