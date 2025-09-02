class Solution {
    /**
     * @param String $digits
     * @return String[]
     */
    function letterCombinations($digits) {
        $map = [
            '2' => ['a', 'b', 'c'],
            '3' => ['d', 'e', 'f'],
            '4' => ['g', 'h', 'i'],
            '5' => ['j', 'k', 'l'],
            '6' => ['m', 'n', 'o'],
            '7' => ['p', 'q', 'r', 's'],
            '8' => ['t', 'u', 'v'],
            '9' => ['w', 'x', 'y', 'z']
        ];
        if ($digits === "") return [];
        $result = [''];
        for ($i = 0; $i < strlen($digits); $i++) {
            $letters = $map[$digits[$i]] ?? [];
            $temp = [];
            foreach ($result as $comb) {
                foreach ($letters as $letter) {
                    $temp[] = $comb . $letter;
                }
            }
            $result = $temp;
        }
        return $result;
    }
}