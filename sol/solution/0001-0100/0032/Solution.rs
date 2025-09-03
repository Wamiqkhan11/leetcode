impl Solution {
    pub fn longest_valid_parentheses(s: String) -> i32 {
        let bytes = s.as_bytes();
        let mut ans = 0i32;
        let (mut left, mut right) = (0, 0);
        for &b in bytes {
            if b == b'(' { left += 1 } else { right += 1 }
            if left == right { ans = ans.max(2 * right as i32); }
            else if right > left { left = 0; right = 0; }
        }
        left = 0; right = 0;
        for &b in bytes.iter().rev() {
            if b == b')' { right += 1 } else { left += 1 }
            if left == right { ans = ans.max(2 * left as i32); }
            else if left > right { left = 0; right = 0; }
        }
        ans
    }
}