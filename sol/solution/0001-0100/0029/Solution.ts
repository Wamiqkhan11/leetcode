function divide(dividend: number, divisor: number): number {
    const INT_MAX = 2 ** 31 - 1;
    const INT_MIN = -(2 ** 31);
    if (dividend === INT_MIN && divisor === -1) return INT_MAX;
    if (dividend === INT_MIN && divisor === 1) return INT_MIN;
    const negative = (dividend > 0) !== (divisor > 0);
    let a = Math.abs(dividend);
    let b = Math.abs(divisor);
    let res = 0;
    while (a >= b) {
        let temp = b;
        let multiple = 1;
        while (a >= temp + temp) {
            temp += temp;
            multiple += multiple;
        }
        a -= temp;
        res += multiple;
    }
    return negative ? -res : res;
}