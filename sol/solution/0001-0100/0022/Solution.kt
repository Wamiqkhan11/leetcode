class Solution {
    fun generateParenthesis(n: Int): List<String> {
        val result = mutableListOf<String>()
        fun backtrack(current: String, open: Int, close: Int) {
            if (current.length == n * 2) {
                result.add(current)
                return
            }
            if (open < n) {
                backtrack(current + "(", open + 1, close)
            }
            if (close < open) {
                backtrack(current + ")", open, close + 1)
            }
        }
        backtrack("", 0, 0)
        return result
    }
}