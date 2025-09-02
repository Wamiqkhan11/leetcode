class Solution {
    /**
     * @param String $haystack
     * @param String $needle
     * @return Integer
     */
    function strStr($haystack, $needle) {
        $n = strlen($haystack);
        $m = strlen($needle);
        if ($m == 0) return 0;
        $lps = array_fill(0, $m, 0);
        for ($i = 1, $len = 0; $i < $m; ) {
            if ($needle[$i] == $needle[$len]) {
                $lps[$i++] = ++$len;
            } elseif ($len > 0) {
                $len = $lps[$len - 1];
            } else {
                $lps[$i++] = 0;
            }
        }
        for ($i = 0, $j = 0; $i < $n; ) {
            if ($haystack[$i] == $needle[$j]) {
                $i++; $j++;
                if ($j == $m) return $i - $m;
            } elseif ($j > 0) {
                $j = $lps[$j - 1];
            } else {
                $i++;
            }
        }
        return -1;
    }
}