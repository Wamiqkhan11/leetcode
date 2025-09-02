class Solution {
    fun strStr(haystack: String, needle: String): Int {
        val n = haystack.length
        val m = needle.length
        if (m == 0) return 0
        val lps = IntArray(m)
        var len = 0
        var i = 1
        while (i < m) {
            if (needle[i] == needle[len]) {
                len++
                lps[i] = len
                i++
            } else if (len > 0) {
                len = lps[len - 1]
            } else {
                lps[i] = 0
                i++
            }
        }
        i = 0; var j = 0
        while (i < n) {
            if (haystack[i] == needle[j]) {
                i++; j++
                if (j == m) return i - m
            } else if (j > 0) {
                j = lps[j - 1]
            } else {
                i++
            }
        }
        return -1
    }
}