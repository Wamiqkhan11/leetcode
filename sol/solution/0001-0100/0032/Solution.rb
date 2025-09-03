# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  ans = left = right = 0
  s.each_char do |ch|
    if ch == '(' then left += 1 else right += 1 end
    if left == right
      ans = [ans, 2 * right].max
    elsif right > left
      left = right = 0
    end
  end
  left = right = 0
  s.reverse.each_char do |ch|
    if ch == ')' then right += 1 else left += 1 end
    if left == right
      ans = [ans, 2 * left].max
    elsif left > right
      left = right = 0
    end
  end
  ans
end