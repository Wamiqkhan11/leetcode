class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        backtrack(&result, "", 0, 0, n)
        return result
    }
    private func backtrack(_ result: inout [String], _ current: String, _ open: Int, _ close: Int, _ max: Int) {
        if current.count == max * 2 {
            result.append(current)
            return
        }
        if open < max {
            backtrack(&result, current + "(", open + 1, close, max)
        }
        if close < open {
            backtrack(&result, current + ")", open, close + 1, max)
        }
    }
}