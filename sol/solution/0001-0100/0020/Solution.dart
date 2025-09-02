class Solution {
  bool isValid(String s) {
    List<String> stack = [];
    for (var c in s.split('')) {
      if (c == '(' || c == '{' || c == '[') {
        stack.add(c);
      } else {
        if (stack.isEmpty) return false;
        var top = stack.removeLast();
        if ((c == ')' && top != '(') || 
            (c == '}' && top != '{') || 
            (c == ']' && top != '[')) {
          return false;
        }
      }
    }
    return stack.isEmpty;
  }
}