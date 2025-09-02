func findSubstring(s string, words []string) []int {
    if len(words) == 0 {
        return []int{}
    }
    wordLen := len(words[0])
    wordCount := make(map[string]int)
    for _, w := range words {
        wordCount[w]++
    }
    res := []int{}
    for i := 0; i < wordLen; i++ {
        left, count := i, 0
        seen := make(map[string]int)
        for j := i; j+wordLen <= len(s); j += wordLen {
            word := s[j:j+wordLen]
            if _, ok := wordCount[word]; ok {
                seen[word]++
                count++
                for seen[word] > wordCount[word] {
                    leftWord := s[left : left+wordLen]
                    seen[leftWord]--
                    left += wordLen
                    count--
                }
                if count == len(words) {
                    res = append(res, left)
                }
            } else {
                seen = make(map[string]int)
                count = 0
                left = j + wordLen
            }
        }
    }
    return res
}