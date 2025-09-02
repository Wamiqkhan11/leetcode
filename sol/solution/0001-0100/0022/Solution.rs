impl Solution {
    pub fn generate_parenthesis(n: i32) -> Vec<String> {
        let mut result = Vec::new();
        Self::backtrack(&mut result, String::new(), 0, 0, n);
        result
    }
    fn backtrack(result: &mut Vec<String>, current: String, open: i32, close: i32, max: i32) {
        if current.len() == (max * 2) as usize {
            result.push(current);
            return;
        }
        if open < max {
            Self::backtrack(result, format!("{}(", current), open + 1, close, max);
        }
        if close < open {
            Self::backtrack(result, format!("{}{}", current, ")"), open, close + 1, max);
        }
    }
}