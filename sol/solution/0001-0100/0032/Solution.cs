public class Solution {
    public int LongestValidParentheses(string s) {
        int ans = 0, left = 0, right = 0;
        foreach (var c in s) {
            if (c == '(') left++; else right++;
            if (left == right) ans = Math.Max(ans, 2 * right);
            else if (right > left) { left = right = 0; }
        }
        left = right = 0;
        for (int i = s.Length - 1; i >= 0; i--) {
            if (s[i] == ')') right++; else left++;
            if (left == right) ans = Math.Max(ans, 2 * left);
            else if (left > right) { left = right = 0; }
        }
        return ans;
    }
}