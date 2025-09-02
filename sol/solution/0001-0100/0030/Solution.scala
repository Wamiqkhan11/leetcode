object Solution {
    def findSubstring(s: String, words: Array[String]): List[Int] = {
        if (s.isEmpty || words.isEmpty) return List()
        val wordLen = words(0).length
        val wordCount = words.groupBy(identity).view.mapValues(_.length).toMap
        val totalLen = wordLen * words.length
        val res = scala.collection.mutable.ListBuffer[Int]()
        for (i <- 0 until wordLen) {
            var left = i
            var right = i
            var seen = scala.collection.mutable.Map[String, Int]()
            while (right + wordLen <= s.length) {
                val word = s.substring(right, right + wordLen)
                right += wordLen
                if (wordCount.contains(word)) {
                    seen(word) = seen.getOrElse(word, 0) + 1
                    while (seen(word) > wordCount(word)) {
                        val leftWord = s.substring(left, left + wordLen)
                        seen(leftWord) -= 1
                        left += wordLen
                    }
                    if (right - left == totalLen) {
                        res += left
                    }
                } else {
                    seen.clear()
                    left = right
                }
            }
        }
        res.toList
    }
}