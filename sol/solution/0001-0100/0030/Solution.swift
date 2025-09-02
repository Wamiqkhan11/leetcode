class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        if words.isEmpty { return [] }
        let wordLen = words[0].count, totalLen = wordLen * words.count
        var wordCount = [String: Int]()
        for w in words { wordCount[w, default: 0] += 1 }
        let sArr = Array(s)
        var res = [Int]()
        for i in 0..<wordLen {
            var left = i, count = 0
            var seen = [String: Int]()
            var j = i
            while j + wordLen <= s.count {
                let word = String(sArr[j..<j+wordLen])
                if let _ = wordCount[word] {
                    seen[word, default: 0] += 1
                    count += 1
                    while seen[word]! > wordCount[word]! {
                        let leftWord = String(sArr[left..<left+wordLen])
                        seen[leftWord]! -= 1
                        left += wordLen
                        count -= 1
                    }
                    if count == words.count { res.append(left) }
                } else {
                    seen.removeAll()
                    count = 0
                    left = j + wordLen
                }
                j += wordLen
            }
        }
        return res
    }
}