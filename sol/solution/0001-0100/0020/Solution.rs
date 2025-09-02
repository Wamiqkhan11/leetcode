impl Solution {
    pub fn is_valid(s: String) -> bool {
        let mut stack = Vec::new();
        for c in s.chars() {
            if c == '(' || c == '{' || c == '[' {
                stack.push(c);
            } else {
                if stack.is_empty() {
                    return false;
                }
                let top = stack.pop().unwrap();
                if (c == ')' && top != '(') || 
                   (c == '}' && top != '{') || 
                   (c == ']' && top != '[') {
                    return false;
                }
            }
        }
        stack.is_empty()
    }
}