int cmp(const void* a, const void* b) {
    return (*(int*)a - *(int*)b);
}
int threeSumClosest(int* nums, int numsSize, int target) {
    qsort(nums, numsSize, sizeof(int), cmp);
    int closestSum = nums[0] + nums[1] + nums[2];
    for (int i = 0; i < numsSize - 2; i++) {
        int left = i + 1, right = numsSize - 1;
        while (left < right) {
            int currSum = nums[i] + nums[left] + nums[right];
            if (currSum == target) return currSum;
            if (abs(currSum - target) < abs(closestSum - target)) {
                closestSum = currSum;
            }
            if (currSum < target) left++;
            else right--;
        }
    }
    return closestSum;
}