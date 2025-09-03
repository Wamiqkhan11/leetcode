/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int findBound(int* nums, int numsSize, int target, int first) {
    int l = 0, r = numsSize - 1, ans = -1;
    while (l <= r) {
        int mid = l + (r - l) / 2;
        if (nums[mid] == target) {
            ans = mid;
            if (first) r = mid - 1;
            else l = mid + 1;
        } else if (nums[mid] < target) l = mid + 1;
        else r = mid - 1;
    }
    return ans;
}
int* searchRange(int* nums, int numsSize, int target, int* returnSize) {
    int* res = (int*)malloc(2 * sizeof(int));
    res[0] = findBound(nums, numsSize, target, 1);
    res[1] = findBound(nums, numsSize, target, 0);
    *returnSize = 2;
    return res;
}