class Solution {
    /**
     * @param Integer[] $nums
     * @return Integer
     */
    function removeDuplicates(&$nums) {
        if (count($nums) === 0) return 0;
        $k = 0;
        for ($i = 1; $i < count($nums); $i++) {
            if ($nums[$i] !== $nums[$k]) {
                $k++;
                $nums[$k] = $nums[$i];
            }
        }
        return $k + 1;
    }
}