object Solution {
    def letterCombinations(digits: String): List[String] = {
        val digitToLetters = Map(
            '2' -> "abc",
            '3' -> "def",
            '4' -> "ghi",
            '5' -> "jkl",
            '6' -> "mno",
            '7' -> "pqrs",
            '8' -> "tuv",
            '9' -> "wxyz"
        )
        if (digits.isEmpty) return List()
        digits.foldLeft(List("")) { (acc, digit) =>
            for {
                combination <- acc
                letter <- digitToLetters.getOrElse(digit, "")
            } yield combination + letter
        }
    }
}