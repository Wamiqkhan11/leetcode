class Solution {
    public int divide(int dividend, int divisor) {
        if (dividend == Integer.MIN_VALUE && divisor == -1) return Integer.MAX_VALUE;
        if (dividend == Integer.MIN_VALUE && divisor == 1) return Integer.MIN_VALUE;
        long a = Math.abs((long) dividend);
        long b = Math.abs((long) divisor);
        long res = 0;
        while (a >= b) {
            long temp = b, multiple = 1;
            while ((temp << 1) <= a) {
                temp <<= 1;
                multiple <<= 1;
            }
            a -= temp;
            res += multiple;
        }
        return ((dividend > 0) ^ (divisor > 0)) ? (int)-res : (int)res;
    }
}