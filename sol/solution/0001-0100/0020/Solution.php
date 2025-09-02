class Solution {
    /**
     * @param String $s
     * @return Boolean
     */
    function isValid($s) {
        $stack = [];
        foreach (str_split($s) as $c) {
            if ($c == '(' || $c == '{' || $c == '[') {
                array_push($stack, $c);
            } else {
                if (empty($stack)) return false;
                $top = array_pop($stack);
                if (($c == ')' && $top != '(') || 
                    ($c == '}' && $top != '{') || 
                    ($c == ']' && $top != '[')) {
                    return false;
                }
            }
        }
        return empty($stack);
    }
}