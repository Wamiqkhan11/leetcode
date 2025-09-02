# @param {String} s
# @return {Boolean}
def is_valid(s)
    stack = []
    s.each_char do |c|
        if c == '(' || c == '{' || c == '['
            stack.push(c)
        else
            return false if stack.empty?
            top = stack.pop
            return false if (c == ')' && top != '(') || 
                           (c == '}' && top != '{') || 
                           (c == ']' && top != '[')
        end
    end
    stack.empty?
end