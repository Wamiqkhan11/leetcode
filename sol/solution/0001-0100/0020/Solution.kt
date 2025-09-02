class Solution {
    fun isValid(s: String): Boolean {
        val stack = mutableListOf<Char>()
        for (c in s) {
            if (c == '(' || c == '{' || c == '[') {
                stack.add(c)
            } else {
                if (stack.isEmpty()) return false
                val top = stack.removeAt(stack.size - 1)
                if ((c == ')' && top != '(') || 
                    (c == '}' && top != '{') || 
                    (c == ']' && top != '[')) {
                    return false
                }
            }
        }
        return stack.isEmpty()
    }
}