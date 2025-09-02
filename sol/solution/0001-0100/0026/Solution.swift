class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        var write = 1
        for i in 1..<nums.count {
            if nums[i] != nums[i - 1] {
                nums[write] = nums[i]
                write += 1
            }
        }
        return write
    }
}