public class Solution {
    public int Divide(int dividend, int divisor) {
        if (dividend == int.MinValue && divisor == -1) return int.MaxValue;
        if (dividend == int.MinValue && divisor == 1) return int.MinValue;
        long a = Math.Abs((long)dividend);
        long b = Math.Abs((long)divisor);
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