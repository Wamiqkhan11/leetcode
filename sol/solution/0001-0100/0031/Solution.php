class Solution {
    /**
     * @param Integer[] $nums
     * @return NULL
     */
    function nextPermutation(&$nums) {
        $n = count($nums);
        $i = $n - 2;
        while ($i >= 0 && $nums[$i] >= $nums[$i + 1]) $i--;
        if ($i >= 0) {
            $j = $n - 1;
            while ($nums[$j] <= $nums[$i]) $j--;
            [$nums[$i], $nums[$j]] = [$nums[$j], $nums[$i]];
        }
        $l = $i + 1; $r = $n - 1;
        while ($l < $r) {
            [$nums[$l], $nums[$r]] = [$nums[$r], $nums[$l]];
            $l++; $r--;
        }
    }
}