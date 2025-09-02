class Solution {
public:
    vector<string> letterCombinations(string digits) {
        if (digits.empty()) return {};
        vector<string> mapping = {"", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"};
        vector<string> result;
        function<void(int, string)> backtrack = [&](int idx, string curr) {
            if (idx == digits.size()) {
                result.push_back(curr);
                return;
            }
            for (char c : mapping[digits[idx] - '0']) {
                backtrack(idx + 1, curr + c);
            }
        };
        backtrack(0, "");
        return result;
    }
};