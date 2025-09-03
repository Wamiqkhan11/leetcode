class Solution {
    /**
     * @param String $s
     * @return Integer
     */
    function longestValidParentheses($s) {
        $n = strlen($s); $ans = 0; $left = 0; $right = 0;
        for ($i = 0; $i < $n; $i++) {
            if ($s[$i] === '(') $left++; else $right++;
            if ($left === $right) $ans = max($ans, 2 * $right);
            else if ($right > $left) { $left = $right = 0; }
        }
        $left = $right = 0;
        for ($i = $n - 1; $i >= 0; $i--) {
            if ($s[$i] === ')') $right++; else $left++;
            if ($left === $right) $ans = max($ans, 2 * $left);
            else if ($left > $right) { $left = $right = 0; }
        }
        return $ans;
    }
}