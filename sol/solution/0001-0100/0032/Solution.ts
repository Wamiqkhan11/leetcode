function longestValidParentheses(s: string): number {
    let ans = 0, left = 0, right = 0;
    for (const ch of s) {
        if (ch === '(') left++; else right++;
        if (left === right) ans = Math.max(ans, 2 * right);
        else if (right > left) { left = right = 0; }
    }
    left = right = 0;
    for (let i = s.length - 1; i >= 0; i--) {
        if (s[i] === ')') right++; else left++;
        if (left === right) ans = Math.max(ans, 2 * left);
        else if (left > right) { left = right = 0; }
    }
    return ans;
}