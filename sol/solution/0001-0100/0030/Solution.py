class Solution:
    def findSubstring(self, s: str, words: List[str]) -> List[int]:
        if not s or not words: return []
        word_len, total_len = len(words[0]), len(words) * len(words[0])
        if len(s) < total_len: return []
        word_count = Counter(words)
        res = []
        for i in range(word_len):
            left, count = i, 0
            seen = defaultdict(int)
            for j in range(i, len(s) - word_len + 1, word_len):
                w = s[j:j+word_len]
                if w in word_count:
                    seen[w] += 1
                    count += 1
                    while seen[w] > word_count[w]:
                        left_word = s[left:left+word_len]
                        seen[left_word] -= 1
                        left += word_len
                        count -= 1
                    if count == len(words):
                        res.append(left)
                else:
                    seen.clear()
                    count = 0
                    left = j + word_len
        return res