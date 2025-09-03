class Solution {
  int longestValidParentheses(String s) {
    int ans = 0, left = 0, right = 0;
    for (var ch in s.split('')) {
      if (ch == '(') left++; else right++;
      if (left == right) ans = ans > 2*right ? ans : 2*right;
      else if (right > left) { left = 0; right = 0; }
    }
    left = 0; right = 0;
    for (var ch in s.split('').reversed) {
      if (ch == ')') right++; else left++;
      if (left == right) ans = ans > 2*left ? ans : 2*left;
      else if (left > right) { left = 0; right = 0; }
    }
    return ans;
  }
}