class Solution {
public:
    vector<int> findSubstring(string s, vector<string>& words) {
        vector<int> res;
        if (words.empty() || s.empty()) return res;
        int wordLen = words[0].size(), totalLen = wordLen * words.size();
        if (s.size() < totalLen) return res;
        unordered_map<string, int> wordCount;
        for (auto &w : words) wordCount[w]++;
        for (int i = 0; i < wordLen; i++) {
            unordered_map<string, int> seen;
            int left = i, count = 0;
            for (int j = i; j + wordLen <= s.size(); j += wordLen) {
                string w = s.substr(j, wordLen);
                if (wordCount.count(w)) {
                    seen[w]++;
                    count++;
                    while (seen[w] > wordCount[w]) {
                        string leftWord = s.substr(left, wordLen);
                        seen[leftWord]--;
                        left += wordLen;
                        count--;
                    }
                    if (count == words.size()) res.push_back(left);
                } else {
                    seen.clear();
                    count = 0;
                    left = j + wordLen;
                }
            }
        }
        return res;
    }
};