/**
 * @param {number} dividend
 * @param {number} divisor
 * @return {number}
 */
var divide = function(dividend, divisor) {
    const INT_MAX = 2 ** 31 - 1;
    const INT_MIN = -(2 ** 31);
    if (divisor === 0) return INT_MAX;
    if (dividend === INT_MIN && divisor === -1) return INT_MAX;
    if (dividend === INT_MIN && divisor === 1) return INT_MIN;
    let a = Math.abs(dividend);
    let b = Math.abs(divisor);
    let res = 0;
    while (a >= b) {
        let temp = b, multiple = 1;
        while (temp + temp <= a) {
            temp += temp;
            multiple += multiple;
        }
        a -= temp;
        res += multiple;
    }
    const negative = (dividend < 0) !== (divisor < 0);
    return negative ? -res : res;
};