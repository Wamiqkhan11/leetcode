class Solution {
  int threeSumClosest(List<int> nums, int target) {
    nums.sort();
    int n = nums.length, closestSum = nums[0] + nums[1] + nums[2];
    for (int i = 0; i < n - 2; i++) {
      int left = i + 1, right = n - 1;
      while (left < right) {
        int currSum = nums[i] + nums[left] + nums[right];
        if (currSum == target) return currSum;
        if ((currSum - target).abs() < (closestSum - target).abs()) {
          closestSum = currSum;
        }
        if (currSum < target) left++;
        else right--;
      }
    }
    return closestSum;
  }
}