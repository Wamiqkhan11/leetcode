public class Solution {
    public int StrStr(string haystack, string needle) {
        int n = haystack.Length, m = needle.Length;
        if (m == 0) return 0;
        int[] lps = new int[m];
        for (int i = 1, len = 0; i < m; ) {
            if (needle[i] == needle[len]) {
                lps[i++] = ++len;
            } else if (len > 0) {
                len = lps[len - 1];
            } else {
                lps[i++] = 0;
            }
        }
        for (int i = 0, j = 0; i < n; ) {
            if (haystack[i] == needle[j]) {
                i++; j++;
                if (j == m) return i - m;
            } else if (j > 0) {
                j = lps[j - 1];
            } else {
                i++;
            }
        }
        return -1;
    }
}