class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var ans = 0, left = 0, right = 0
        for ch in s {
            if ch == "(" { left += 1 } else { right += 1 }
            if left == right { ans = max(ans, 2 * right) }
            else if right > left { left = 0; right = 0 }
        }
        left = 0; right = 0
        for ch in s.reversed() {
            if ch == ")" { right += 1 } else { left += 1 }
            if left == right { ans = max(ans, 2 * left) }
            else if left > right { left = 0; right = 0 }
        }
        return ans
    }
}