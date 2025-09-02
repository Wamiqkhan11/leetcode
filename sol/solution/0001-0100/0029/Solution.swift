class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let INT_MAX = 2_147_483_647
        let INT_MIN = -2_147_483_648
        if dividend == INT_MIN && divisor == -1 { return INT_MAX }
        if dividend == INT_MIN && divisor == 1 { return INT_MIN }
        let negative = (dividend > 0) != (divisor > 0)
        var a = abs(dividend)
        var b = abs(divisor)
        var res = 0
        while a >= b {
            var temp = b
            var multiple = 1
            while a >= temp + temp {
                temp += temp
                multiple += multiple
            }
            a -= temp
            res += multiple
        }
        return negative ? -res : res
    }
}