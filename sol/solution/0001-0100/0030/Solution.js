/**
 * @param {string} s
 * @param {string[]} words
 * @return {number[]}
 */
var findSubstring = function(s, words) {
    if (!s.length || !words.length) return [];
    const wordLen = words[0].length, totalLen = wordLen * words.length;
    if (s.length < totalLen) return [];
    const wordCount = {};
    for (let w of words) wordCount[w] = (wordCount[w] || 0) + 1;
    const res = [];
    for (let i = 0; i < wordLen; i++) {
        let left = i, count = 0;
        let seen = {};
        for (let j = i; j + wordLen <= s.length; j += wordLen) {
            let w = s.substr(j, wordLen);
            if (wordCount[w]) {
                seen[w] = (seen[w] || 0) + 1;
                count++;
                while (seen[w] > wordCount[w]) {
                    let leftWord = s.substr(left, wordLen);
                    seen[leftWord]--;
                    left += wordLen;
                    count--;
                }
                if (count === words.length) res.push(left);
            } else {
                seen = {};
                count = 0;
                left = j + wordLen;
            }
        }
    }
    return res;
};