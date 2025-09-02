class Solution {
    fun fourSum(nums: IntArray, target: Int): List<List<Int>> {
        val result = mutableListOf<List<Int>>()
        val n = nums.size
        if (n < 4) return result
        nums.sort()
        for (i in 0 until n - 3) {
            if (i > 0 && nums[i] == nums[i - 1]) continue
            for (j in i + 1 until n - 2) {
                if (j > i + 1 && nums[j] == nums[j - 1]) continue
                var left = j + 1
                var right = n - 1
                while (left < right) {
                    val sum = nums[i].toLong() + nums[j] + nums[left] + nums[right]
                    if (sum == target.toLong()) {
                        result.add(listOf(nums[i], nums[j], nums[left], nums[right]))
                        while (left < right && nums[left] == nums[left + 1]) left++
                        while (left < right && nums[right] == nums[right - 1]) right--
                        left++
                        right--
                    } else if (sum < target) left++
                    else right--
                }
            }
        }
        return result
    }
}