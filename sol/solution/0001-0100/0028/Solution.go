func strStr(haystack string, needle string) int {
    n, m := len(haystack), len(needle)
    if m == 0 {
        return 0
    }
    lps := make([]int, m)
    for i, length := 1, 0; i < m; {
        if needle[i] == needle[length] {
            length++
            lps[i] = length
            i++
        } else if length > 0 {
            length = lps[length-1]
        } else {
            lps[i] = 0
            i++
        }
    }
    for i, j := 0, 0; i < n; {
        if haystack[i] == needle[j] {
            i++; j++
            if j == m {
                return i - m
            }
        } else if j > 0 {
            j = lps[j-1]
        } else {
            i++
        }
    }
    return -1
}