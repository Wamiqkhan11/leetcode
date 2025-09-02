class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }
        let mapping: [Character: [String]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
        ]
        var result: [String] = [""]
        for digit in digits {
            guard let letters = mapping[digit] else { continue }
            var temp: [String] = []
            for prefix in result {
                for letter in letters {
                    temp.append(prefix + letter)
                }
            }
            result = temp
        }
        return result
    }
}