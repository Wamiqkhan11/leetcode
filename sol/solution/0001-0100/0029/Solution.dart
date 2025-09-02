class Solution {
  int divide(int dividend, int divisor) {
    const intMax = 2147483647;
    const intMin = -2147483648;
    if (dividend == intMin && divisor == -1) return intMax;
    if (dividend == intMin && divisor == 1) return intMin;
    int a = dividend.abs();
    int b = divisor.abs();
    int res = 0;
    while (a >= b) {
      int temp = b, multiple = 1;
      while ((temp << 1) <= a) {
        temp <<= 1;
        multiple <<= 1;
      }
      a -= temp;
      res += multiple;
    }
    return ((dividend > 0) ^ (divisor > 0)) ? -res : res;
  }
}