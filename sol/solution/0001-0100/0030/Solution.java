class Solution {
    public List<Integer> findSubstring(String s, String[] words) {
        List<Integer> res = new ArrayList<>();
        if (words.length == 0 || s.length() == 0) return res;
        int wordLen = words[0].length(), totalLen = wordLen * words.length;
        if (s.length() < totalLen) return res;
        Map<String, Integer> wordCount = new HashMap<>();
        for (String w : words) wordCount.put(w, wordCount.getOrDefault(w, 0) + 1);
        for (int i = 0; i < wordLen; i++) {
            Map<String, Integer> seen = new HashMap<>();
            int left = i, count = 0;
            for (int j = i; j + wordLen <= s.length(); j += wordLen) {
                String w = s.substring(j, j + wordLen);
                if (wordCount.containsKey(w)) {
                    seen.put(w, seen.getOrDefault(w, 0) + 1);
                    count++;
                    while (seen.get(w) > wordCount.get(w)) {
                        String leftWord = s.substring(left, left + wordLen);
                        seen.put(leftWord, seen.get(leftWord) - 1);
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