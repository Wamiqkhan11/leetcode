class Solution {
  int removeDuplicates(List<int> nums) {
    if (nums.isEmpty) return 0;
    int write = 1;
    for (int i = 1; i < nums.length; i++) {
      if (nums[i] != nums[write - 1]) {
        nums[write] = nums[i];
        write++;
      }
    }
    return write;
  }
}