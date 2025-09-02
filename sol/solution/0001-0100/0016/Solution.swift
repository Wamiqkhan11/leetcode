class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        let n = nums.count
        var closestSum = nums[0] + nums[1] + nums[2]
        for i in 0..<(n - 2) {
            var left = i + 1, right = n - 1
            while left < right {
                let currSum = nums[i] + nums[left] + nums[right]
                if currSum == target { return currSum }
                if abs(currSum - target) < abs(closestSum - target) {
                    closestSum = currSum
                }
                if currSum < target {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return closestSum
    }
}