object Solution {
  def longestValidParentheses(s: String): Int = {
    var ans = 0; var left = 0; var right = 0
    s.foreach { ch =>
      if (ch == '(') left += 1 else right += 1
      if (left == right) ans = math.max(ans, 2 * right)
      else if (right > left) { left = 0; right = 0 }
    }
    left = 0; right = 0
    s.reverse.foreach { ch =>
      if (ch == ')') right += 1 else left += 1
      if (left == right) ans = math.max(ans, 2 * left)
      else if (left > right) { left = 0; right = 0 }
    }
    ans
  }
}