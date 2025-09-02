class Solution {
    fun divide(dividend: Int, divisor: Int): Int {
        if (dividend == Int.MIN_VALUE && divisor == -1) return Int.MAX_VALUE
        var a = dividend.toLong()
        var b = divisor.toLong()
        val negative = (a < 0) xor (b < 0)
        a = kotlin.math.abs(a)
        b = kotlin.math.abs(b)
        var result = 0L
        for (i in 31 downTo 0) {
            if ((a shr i) >= b) {
                result += 1L shl i
                a -= b shl i
            }
        }
        if (negative) result = -result
        if (result > Int.MAX_VALUE) return Int.MAX_VALUE
        if (result < Int.MIN_VALUE) return Int.MIN_VALUE
        return result.toInt()
    }
}