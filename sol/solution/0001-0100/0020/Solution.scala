object Solution {
    import scala.collection.mutable
    def isValid(s: String): Boolean = {
        val stack = new Array[Char](s.length)
        val openBrackets = "({["
        var result = true
        var index = 0
        var stackIndex = 0
        while (index < s.length && result) {
            val currentBracket = s.charAt(index)
            if(currentBracket == '(') {
                stack(stackIndex) = ')'
                stackIndex += 1
            } else if (currentBracket == '{') {
                stack(stackIndex) = '}'
                stackIndex += 1
            } else if (currentBracket == '[') {
                stack(stackIndex) = ']'
                stackIndex += 1
            } else if(stackIndex > 0 && stack(stackIndex-1) == currentBracket) {
                stackIndex -= 1
            } else {
                result = false
            }
            index += 1
        }
        stackIndex == 0 && result
    }
}