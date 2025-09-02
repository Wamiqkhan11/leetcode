function findSubstring(s: string, words: string[]): number[] {
    if (!s.length || !words.length) return [];
    const wordLen = words[0].length, totalLen = wordLen * words.length;
    if (s.length < totalLen) return [];
    const wordCount: Record<string, number> = {};
    for (let w of words) wordCount[w] = (wordCount[w] || 0) + 1;
    const res: number[] = [];
    for (let i = 0; i < wordLen; i++) {
        let left = i, count = 0;
        let seen: Record<string, number> = {};
        for (let j = i; j + wordLen <= s.length; j += wordLen) {
            let w = s.substring(j, j + wordLen);
            if (wordCount[w]) {
                seen[w] = (seen[w] || 0) + 1;
                count++;
                while (seen[w] > wordCount[w]) {
                    let leftWord = s.substring(left, left + wordLen);
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
}