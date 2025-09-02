public class Solution {
    public IList<string> GenerateParenthesis(int n) {
        IList<string> result = new List<string>();
        char[] current = new char[2 * n];
        backtrack(result, current, 0, 0, n);
        return result;
    }
    private void backtrack(IList<string> result, char[] current, int open, int close, int n) {
        if (open == n && close == n) {
            result.Add(new string(current));
            return;
        }
        if (open < n) {
            current[open + close] = '(';
            backtrack(result, current, open + 1, close, n);
        }
        if (close < open) {
            current[open + close] = ')';
            backtrack(result, current, open, close + 1, n);
        }
    }
}