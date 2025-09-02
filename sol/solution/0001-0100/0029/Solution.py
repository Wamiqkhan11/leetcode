class Solution:
    def divide(self, dividend: int, divisor: int) -> int:
        INT_MAX, INT_MIN = 2**31 - 1, -2**31
        if dividend == INT_MIN and divisor == -1:
            return INT_MAX
        if dividend == INT_MIN and divisor == 1:
            return INT_MIN
        a, b = abs(dividend), abs(divisor)
        res = 0
        while a >= b:
            temp, multiple = b, 1
            while (temp << 1) <= a:
                temp <<= 1
                multiple <<= 1
            a -= temp
            res += multiple
        return -res if (dividend > 0) ^ (divisor > 0) else res