object Solution {
  def strStr(haystack: String, needle: String): Int = {
    val n = haystack.length
    val m = needle.length
    if (m == 0) return 0
    val lps = Array.fill(m)(0)
    var len = 0
    var i = 1
    while (i < m) {
      if (needle(i) == needle(len)) {
        len += 1
        lps(i) = len
        i += 1
      } else if (len > 0) {
        len = lps(len - 1)
      } else {
        lps(i) = 0
        i += 1
      }
    }
    i = 0; var j = 0
    while (i < n) {
      if (haystack(i) == needle(j)) {
        i += 1; j += 1
        if (j == m) return i - m
      } else if (j > 0) {
        j = lps(j - 1)
      } else {
        i += 1
      }
    }
    -1
  }
}