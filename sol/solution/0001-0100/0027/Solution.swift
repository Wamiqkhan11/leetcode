class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var n = nums.count
        var i = 0
        while i < n {
            if nums[i] == val {
                nums[i] = nums[n - 1]
                n -= 1
            } else {
                i += 1
            }
        }
        return n
    }
}