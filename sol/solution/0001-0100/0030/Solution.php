class Solution {
    /**
     * @param String $s
     * @param String[] $words
     * @return Integer[]
     */
    function findSubstring($s, $words) {
        if (!$s || count($words) == 0) return [];
        $wordLen = strlen($words[0]);
        $totalLen = $wordLen * count($words);
        $wordCount = array_count_values($words);
        $res = [];
        for ($i = 0; $i < $wordLen; $i++) {
            $left = $i; $count = 0; $seen = [];
            for ($j = $i; $j + $wordLen <= strlen($s); $j += $wordLen) {
                $word = substr($s, $j, $wordLen);
                if (isset($wordCount[$word])) {
                    $seen[$word] = ($seen[$word] ?? 0) + 1;
                    $count++;
                    while ($seen[$word] > $wordCount[$word]) {
                        $leftWord = substr($s, $left, $wordLen);
                        $seen[$leftWord]--;
                        $left += $wordLen;
                        $count--;
                    }
                    if ($count == count($words)) $res[] = $left;
                } else {
                    $seen = [];
                    $count = 0;
                    $left = $j + $wordLen;
                }
            }
        }
        return $res;
    }
}