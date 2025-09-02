func isValid(s string) bool {
    stack := []rune{}
    for _, c := range s {
        if c == '(' || c == '{' || c == '[' {
            stack = append(stack, c)
        } else {
            if len(stack) == 0 {
                return false
            }
            top := stack[len(stack)-1]
            stack = stack[:len(stack)-1]
            if (c == ')' && top != '(') || 
               (c == '}' && top != '{') || 
               (c == ']' && top != '[') {
                return false
            }
        }
    }
    return len(stack) == 0
}