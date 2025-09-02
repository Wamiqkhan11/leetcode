int removeElement(int* nums, int numsSize, int val) {
    int n = numsSize, i = 0;
    while (i < n) {
        if (nums[i] == val) {
            nums[i] = nums[n - 1];
            --n;
        } else {
            ++i;
        }
    }
    return n;
}