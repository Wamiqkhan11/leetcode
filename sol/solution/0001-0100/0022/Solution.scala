object Solution {
    def generateParenthesis(n: Int): List[String] = {
        def backtrack(s: String, left: Int, right: Int): List[String] = {
            if (s.length == n * 2) List(s)
            else {
                val addLeft = if (left < n) backtrack(s + "(", left + 1, right) else Nil
                val addRight = if (right < left) backtrack(s + ")", left, right + 1) else Nil
                addLeft ++ addRight
            }
        }
        backtrack("", 0, 0)
    }
}