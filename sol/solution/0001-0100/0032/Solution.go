func longestValidParentheses(s string) int {
    ans, left, right := 0, 0, 0
    for i := 0; i < len(s); i++ {
        if s[i] == '(' { left++ } else { right++ }
        if left == right {
            if 2*right > ans { ans = 2 * right }
        } else if right > left {
            left, right = 0, 0
        }
    }
    left, right = 0, 0
    for i := len(s) - 1; i >= 0; i-- {
        if s[i] == ')' { right++ } else { left++ }
        if left == right {
            if 2*left > ans { ans = 2 * left }
        } else if left > right {
            left, right = 0, 0
        }
    }
    return ans
}