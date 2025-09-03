class Solution {
    /**
     * @param Integer[] $nums
     * @param Integer $target
     * @return Integer[]
     */
    function searchRange($nums, $target) {
        $findBound = function($first) use ($nums, $target) {
            $l = 0; $r = count($nums) - 1; $ans = -1;
            while ($l <= $r) {
                $mid = intdiv($l + $r, 2);
                if ($nums[$mid] == $target) {
                    $ans = $mid;
                    if ($first) $r = $mid - 1;
                    else $l = $mid + 1;
                } elseif ($nums[$mid] < $target) $l = $mid + 1;
                else $r = $mid - 1;
            }
            return $ans;
        };
        return [$findBound(true), $findBound(false)];
    }
}