class Solution {
    /**
     * @param Integer $dividend
     * @param Integer $divisor
     * @return Integer
     */
    function divide($dividend, $divisor) {
        $INT_MAX = 2 ** 31 - 1;
        $INT_MIN = -(2 ** 31);
        if ($dividend == $INT_MIN && $divisor == -1) return $INT_MAX;
        if ($dividend == $INT_MIN && $divisor == 1) return $INT_MIN;
        $a = abs($dividend);
        $b = abs($divisor);
        $res = 0;
        while ($a >= $b) {
            $temp = $b; $multiple = 1;
            while (($temp << 1) <= $a) {
                $temp <<= 1;
                $multiple <<= 1;
            }
            $a -= $temp;
            $res += $multiple;
        }
        return (($dividend > 0) ^ ($divisor > 0)) ? -$res : $res;
    }
}