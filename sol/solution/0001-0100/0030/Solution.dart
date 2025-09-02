class Solution {
  List<int> findSubstring(String s, List<String> words) {
    if (s.isEmpty || words.isEmpty) return [];
    int wordLen = words[0].length;
    int totalLen = wordLen * words.length;
    Map<String, int> wordCount = {};
    for (var w in words) {
      wordCount[w] = (wordCount[w] ?? 0) + 1;
    }
    List<int> res = [];
    for (int i = 0; i < wordLen; i++) {
      int left = i, count = 0;
      Map<String, int> seen = {};
      for (int j = i; j + wordLen <= s.length; j += wordLen) {
        String word = s.substring(j, j + wordLen);
        if (wordCount.containsKey(word)) {
          seen[word] = (seen[word] ?? 0) + 1;
          count++;
          while (seen[word]! > wordCount[word]!) {
            String leftWord = s.substring(left, left + wordLen);
            seen[leftWord] = seen[leftWord]! - 1;
            left += wordLen;
            count--;
          }
          if (count == words.length) res.add(left);
        } else {
          seen.clear();
          count = 0;
          left = j + wordLen;
        }
      }
    }
    return res;
  }
}