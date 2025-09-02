class Solution {
  List<String> letterCombinations(String digits) {
    if (digits.isEmpty) return [];
    Map<String, String> phone = {
      '2': 'abc',
      '3': 'def',
      '4': 'ghi',
      '5': 'jkl',
      '6': 'mno',
      '7': 'pqrs',
      '8': 'tuv',
      '9': 'wxyz',
    };
    List<String> result = [];
    void backtrack(String combination, int next) {
      if (next == digits.length) {
        result.add(combination);
        return;
      }
      String letters = phone[digits[next]] ?? '';
      for (int i = 0; i < letters.length; i++) {
        backtrack(combination + letters[i], next + 1);
      }
    }
    backtrack('', 0);
    return result;
  }
}