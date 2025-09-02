impl Solution {
    pub fn divide(dividend: i32, divisor: i32) -> i32 {
        if dividend == i32::MIN && divisor == -1 {
            return i32::MAX;
        }
        if dividend == i32::MIN && divisor == 1 {
            return i32::MIN;
        }
        let mut a = (dividend as i64).abs();
        let b = (divisor as i64).abs();
        let mut res = 0i64;
        while a >= b {
            let mut temp = b;
            let mut multiple = 1i64;
            while (temp << 1) <= a {
                temp <<= 1;
                multiple <<= 1;
            }
            a -= temp;
            res += multiple;
        }
        if (dividend > 0) ^ (divisor > 0) {
            -res as i32
        } else {
            res as i32
        }
    }
}