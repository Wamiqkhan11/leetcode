object Solution {
    def divide(dividend: Int, divisor: Int): Int = {
        val INT_MAX = Int.MaxValue
        val INT_MIN = Int.MinValue
        if (dividend == INT_MIN && divisor == -1) return INT_MAX
        if (dividend == INT_MIN && divisor == 1) return INT_MIN
        var a = Math.abs(dividend.toLong)
        var b = Math.abs(divisor.toLong)
        var res = 0L
        while (a >= b) {
            var temp = b
            var multiple = 1L
            while ((temp << 1) <= a) {
                temp <<= 1
                multiple <<= 1
            }
            a -= temp
            res += multiple
        }
        if ((dividend > 0) ^ (divisor > 0)) -res.toInt else res.toInt
    }
}