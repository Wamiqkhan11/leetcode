class Solution {
    fun longestValidParentheses(s: String): Int {
        var ans = 0
        var left = 0
        var right = 0
        for (ch in s) {
            if (ch == '(') left++ else right++
            if (left == right) ans = maxOf(ans, 2 * right)
            else if (right > left) { left = 0; right = 0 }
        }
        left = 0; right = 0
        for (i in s.indices.reversed()) {
            if (s[i] == ')') right++ else left++
            if (left == right) ans = maxOf(ans, 2 * left)
            else if (left > right) { left = 0; right = 0 }
        }
        return ans
    }
}