class Solution {
    fun nextPermutation(nums: IntArray): Unit {
        var i = nums.size - 2
        while (i >= 0 && nums[i] >= nums[i + 1]) i--
        if (i >= 0) {
            var j = nums.size - 1
            while (nums[j] <= nums[i]) j--
            nums[i] = nums[j].also { nums[j] = nums[i] }
        }
        nums.reverse(i + 1, nums.size)
    }
    private fun IntArray.reverse(l: Int, r: Int) {
        var left = l
        var right = r - 1
        while (left < right) {
            this[left] = this[right].also { this[right] = this[left] }
            left++; right--
        }
    }
}