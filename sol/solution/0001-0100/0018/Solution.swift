class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        let n = nums.count
        if n < 4 { return result }
        let sorted = nums.sorted()
        for i in 0..<(n - 3) {
            if i > 0 && sorted[i] == sorted[i - 1] { continue }
            for j in (i + 1)..<(n - 2) {
                if j > i + 1 && sorted[j] == sorted[j - 1] { continue }
                var left = j + 1
                var right = n - 1
                while left < right {
                    let sum = sorted[i] + sorted[j] + sorted[left] + sorted[right]
                    if sum == target {
                        result.append([sorted[i], sorted[j], sorted[left], sorted[right]])
                        while left < right && sorted[left] == sorted[left + 1] { left += 1 }
                        while left < right && sorted[right] == sorted[right - 1] { right -= 1 }
                        left += 1
                        right -= 1
                    } else if sum < target {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
        }
        return result
    }
}