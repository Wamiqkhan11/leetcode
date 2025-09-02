class Solution {
    fun removeElement(nums: IntArray, `val`: Int): Int {
        var n = nums.size
        var i = 0
        while (i < n) {
            if (nums[i] == `val`) {
                nums[i] = nums[n - 1]
                n--
            } else {
                i++
            }
        }
        return n
    }
}