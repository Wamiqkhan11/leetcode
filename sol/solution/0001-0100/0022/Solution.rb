# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
    result = []
    backtrack(result, "", 0, 0, n)
    return result
end
def backtrack(result, current, open, close, max)
    if current.length == max * 2
        result << current
        return
    end
    if open < max
        backtrack(result, current + "(", open + 1, close, max)
    end
    if close < open
        backtrack(result, current + ")", open, close + 1, max)
    end
end