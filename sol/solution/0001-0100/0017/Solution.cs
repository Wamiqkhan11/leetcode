public class Solution {
    public IList<string> LetterCombinations(string digits) {
        var result = new List<string>();
        if (string.IsNullOrEmpty(digits)) return result;
        string[] mapping = new string[] {
            "",    // 0
            "",    // 1
            "abc", // 2
            "def", // 3
            "ghi", // 4
            "jkl", // 5
            "mno", // 6
            "pqrs",// 7
            "tuv", // 8
            "wxyz" // 9
        };
        Backtrack(digits, mapping, 0, "", result);
        return result;
    }
    private void Backtrack(string digits, string[] mapping, int index, string current, List<string> result) {
        if (index == digits.Length) {
            result.Add(current);
            return;
        }
        string letters = mapping[digits[index] - '0'];
        foreach (char c in letters) {
            Backtrack(digits, mapping, index + 1, current + c, result);
        }
    }
}