class Solution {
    List<String> generateParenthesis(int n) {
        List<String> result = [];
        void backtrack(String current, int open, int close) {
            if (current.length == n * 2) {
                result.add(current);
                return;
            }
            if (open < n) {
                backtrack(current + '(', open + 1, close);
            }
            if (close < open) {
                backtrack(current + ')', open, close + 1);
            }
        }
        backtrack('', 0, 0);
        return result;
    }
}