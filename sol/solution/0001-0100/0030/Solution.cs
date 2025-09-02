public class Solution {
    public IList<int> FindSubstring(string s, string[] words) {
        var res = new List<int>();
        if (words.Length == 0 || s.Length == 0) return res;
        int wordLen = words[0].Length, totalLen = wordLen * words.Length;
        if (s.Length < totalLen) return res;
        var wordCount = new Dictionary<string,int>();
        foreach (var w in words) {
            if (!wordCount.ContainsKey(w)) wordCount[w] = 0;
            wordCount[w]++;
        }
        for (int i = 0; i < wordLen; i++) {
            var seen = new Dictionary<string,int>();
            int left = i, count = 0;
            for (int j = i; j + wordLen <= s.Length; j += wordLen) {
                var w = s.Substring(j, wordLen);
                if (wordCount.ContainsKey(w)) {
                    if (!seen.ContainsKey(w)) seen[w] = 0;
                    seen[w]++;
                    count++;
                    while (seen[w] > wordCount[w]) {
                        var leftWord = s.Substring(left, wordLen);
                        seen[leftWord]--;
                        left += wordLen;
                        count--;
                    }
                    if (count == words.Length) res.Add(left);
                } else {
                    seen.Clear();
                    count = 0;
                    left = j + wordLen;
                }
            }
        }
        return res;
    }
}