impl Solution {
    pub fn str_str(haystack: String, needle: String) -> i32 {
        let n = haystack.len();
        let m = needle.len();
        if m == 0 { return 0; }
        let h: Vec<char> = haystack.chars().collect();
        let nd: Vec<char> = needle.chars().collect();
        let mut lps = vec![0; m];
        let (mut len, mut i) = (0, 1);
        while i < m {
            if nd[i] == nd[len] {
                len += 1;
                lps[i] = len;
                i += 1;
            } else if len > 0 {
                len = lps[len - 1];
            } else {
                lps[i] = 0;
                i += 1;
            }
        }
        let (mut j, mut idx) = (0, 0);
        while idx < n {
            if h[idx] == nd[j] {
                idx += 1; j += 1;
                if j == m { return (idx - m) as i32; }
            } else if j > 0 {
                j = lps[j - 1];
            } else {
                idx += 1;
            }
        }
        -1
    }
}