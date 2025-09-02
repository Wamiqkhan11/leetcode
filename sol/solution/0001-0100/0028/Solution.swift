class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let n = haystack.count, m = needle.count
        if m == 0 { return 0 }
        let h = Array(haystack), nd = Array(needle)
        var lps = [Int](repeating: 0, count: m)
        var len = 0, i = 1
        while i < m {
            if nd[i] == nd[len] {
                len += 1
                lps[i] = len
                i += 1
            } else if len > 0 {
                len = lps[len - 1]
            } else {
                lps[i] = 0
                i += 1
            }
        }
        i = 0; var j = 0
        while i < n {
            if h[i] == nd[j] {
                i += 1; j += 1
                if j == m { return i - m }
            } else if j > 0 {
                j = lps[j - 1]
            } else {
                i += 1
            }
        }
        return -1
    }
}