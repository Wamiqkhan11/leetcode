class Solution {
    /**
     * @param Integer[] $nums
     * @param Integer $val
     * @return Integer
     */
    function removeElement(&$nums, $val) {
        $n = count($nums); $i = 0;
        while ($i < $n) {
            if ($nums[$i] === $val) {
                $nums[$i] = $nums[$n - 1];
                $n--;
            } else {
                $i++;
            }
        }
        return $n;
    }
}