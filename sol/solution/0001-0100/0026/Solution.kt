class Solution {
    fun removeDuplicates(nums: IntArray): Int {
        if (nums.isEmpty()) return 0
        var write = 1
        for (i in 1 until nums.size) {
            if (nums[i] != nums[write - 1]) {
                nums[write] = nums[i]
                write++
            }
        }
        return write
    }
}