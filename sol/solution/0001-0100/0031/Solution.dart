class Solution {
  void nextPermutation(List<int> nums) {
    int i = nums.length - 2;
    while (i >= 0 && nums[i] >= nums[i + 1]) i--;
    if (i >= 0) {
      int j = nums.length - 1;
      while (nums[j] <= nums[i]) j--;
      int temp = nums[i]; nums[i] = nums[j]; nums[j] = temp;
    }
    int l = i + 1, r = nums.length - 1;
    while (l < r) {
      int temp = nums[l]; nums[l] = nums[r]; nums[r] = temp;
      l++; r--;
    }
  }
}