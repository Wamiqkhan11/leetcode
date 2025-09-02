# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
def divide(dividend, divisor)
    int_max = (2**31) - 1
    int_min = -(2**31)
    return int_max if dividend == int_min && divisor == -1
    return int_min if dividend == int_min && divisor == 1
    a, b = dividend.abs, divisor.abs
    res = 0
    while a >= b
        temp, multiple = b, 1
        while (temp << 1) <= a
            temp <<= 1
            multiple <<= 1
        end
        a -= temp
        res += multiple
    end
    (dividend > 0) ^ (divisor > 0) ? -res : res
end