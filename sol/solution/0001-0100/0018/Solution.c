int cmp(const void* a, const void* b) {
    return (*(int*)a - *(int*)b);
}
int** fourSum(int* nums, int numsSize, int target, int* returnSize, int** returnColumnSizes) {
    *returnSize = 0;
    if (numsSize < 4) return NULL;
    qsort(nums, numsSize, sizeof(int), cmp);
    int capacity = 256;
    int** result = malloc(capacity * sizeof(int*));
    *returnColumnSizes = malloc(capacity * sizeof(int));
    for (int i = 0; i < numsSize - 3; i++) {
        if (i > 0 && nums[i] == nums[i - 1]) continue;
        long long min1 = (long long)nums[i] + nums[i + 1] + nums[i + 2] + nums[i + 3];
        if (min1 > target) break;
        long long max1 = (long long)nums[i] + nums[numsSize - 1] + nums[numsSize - 2] + nums[numsSize - 3];
        if (max1 < target) continue;
        for (int j = i + 1; j < numsSize - 2; j++) {
            if (j > i + 1 && nums[j] == nums[j - 1]) continue;
            long long min2 = (long long)nums[i] + nums[j] + nums[j + 1] + nums[j + 2];
            if (min2 > target) break;
            long long max2 = (long long)nums[i] + nums[j] + nums[numsSize - 1] + nums[numsSize - 2];
            if (max2 < target) continue;
            int left = j + 1, right = numsSize - 1;
            while (left < right) {
                long long sum = (long long)nums[i] + nums[j] + nums[left] + nums[right];
                if (sum == target) {
                    if (*returnSize == capacity) {
                        capacity *= 2;
                        result = realloc(result, capacity * sizeof(int*));
                        *returnColumnSizes = realloc(*returnColumnSizes, capacity * sizeof(int));
                    }
                    int* quad = result[*returnSize] = malloc(4 * sizeof(int));
                    quad[0] = nums[i];
                    quad[1] = nums[j];
                    quad[2] = nums[left];
                    quad[3] = nums[right];
                    (*returnColumnSizes)[*returnSize] = 4;
                    (*returnSize)++;
                    int last_left = nums[left], last_right = nums[right];
                    while (left < right && nums[left] == last_left) left++;
                    while (left < right && nums[right] == last_right) right--;
                } else if (sum < target) {
                    left++;
                } else {
                    right--;
                }
            }
        }
    }
    if (*returnSize == 0) {
        free(result);
        free(*returnColumnSizes);
        return NULL;
    }
    return result;
}
