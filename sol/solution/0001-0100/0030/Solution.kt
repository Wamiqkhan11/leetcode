class Solution {
    fun findSubstring(s: String, words: Array<String>): List<Int> {
        if (words.isEmpty()) return emptyList()
        val wordLen = words[0].length
        val totalLen = wordLen * words.size
        val wordCount = words.groupingBy { it }.eachCount()
        val res = mutableListOf<Int>()
        for (i in 0 until wordLen) {
            var left = i
            var count = 0
            val seen = mutableMapOf<String, Int>()
            var j = i
            while (j + wordLen <= s.length) {
                val word = s.substring(j, j + wordLen)
                if (wordCount.containsKey(word)) {
                    seen[word] = seen.getOrDefault(word, 0) + 1
                    count++
                    while (seen[word]!! > wordCount[word]!!) {
                        val leftWord = s.substring(left, left + wordLen)
                        seen[leftWord] = seen[leftWord]!! - 1
                        left += wordLen
                        count--
                    }
                    if (count == words.size) res.add(left)
                } else {
                    seen.clear()
                    count = 0
                    left = j + wordLen
                }
                j += wordLen
            }
        }
        return res
    }
}