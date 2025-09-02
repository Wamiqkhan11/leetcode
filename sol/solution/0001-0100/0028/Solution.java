class Solution {
    public int strStr(String haystack, String needle) {
        int n = haystack.length(), m = needle.length();
        if (m == 0) return 0;
        int[] lps = new int[m];
        for (int i = 1, len = 0; i < m; ) {
            if (needle.charAt(i) == needle.charAt(len)) {
                lps[i++] = ++len;
            } else if (len > 0) {
                len = lps[len - 1];
            } else {
                lps[i++] = 0;
            }
        }
        for (int i = 0, j = 0; i < n; ) {
            if (haystack.charAt(i) == needle.charAt(j)) {
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