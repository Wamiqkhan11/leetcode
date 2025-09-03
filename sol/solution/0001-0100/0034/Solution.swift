class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        func findBound(_ first: Bool) -> Int {
            var l = 0, r = nums.count - 1, ans = -1
            while l <= r {
                let mid = (l + r) / 2
                if nums[mid] == target {
                    ans = mid
                    if first { r = mid - 1 }
                    else { l = mid + 1 }
                } else if nums[mid] < target {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
            return ans
        }
        return [findBound(true), findBound(false)]
    }
}