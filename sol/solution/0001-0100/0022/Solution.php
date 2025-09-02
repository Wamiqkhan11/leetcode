class Solution {
    /**
     * @param Integer $n
     * @return String[]
     */
    function generateParenthesis($n) {
        $result = [];
        $this->backtrack($result, "", 0, 0, $n);
        return $result;
    }
    private function backtrack(&$result, $current, $open, $close, $max) {
        if (strlen($current) == $max * 2) {
            $result[] = $current;
            return;
        }
        if ($open < $max) {
            $this->backtrack($result, $current . "(", $open + 1, $close, $max);
        }
        if ($close < $open) {
            $this->backtrack($result, $current . ")", $open, $close + 1, $max);
        }
    }
}