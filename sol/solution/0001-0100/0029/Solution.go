func divide(dividend int, divisor int) int {
    if dividend == math.MinInt32 && divisor == -1 {
        return math.MaxInt32
    }
    if dividend == math.MinInt32 && divisor == 1 {
        return math.MinInt32
    }
    a, b := abs(dividend), abs(divisor)
    res := 0
    for a >= b {
        temp, multiple := b, 1
        for (temp << 1) <= a {
            temp <<= 1
            multiple <<= 1
        }
        a -= temp
        res += multiple
    }
    if (dividend > 0) != (divisor > 0) {
        return -res
    }
    return res
}
func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}