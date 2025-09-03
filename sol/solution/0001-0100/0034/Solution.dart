class Solution {
  List<int> searchRange(List<int> nums, int target) {
    int findBound(bool first) {
      int l = 0, r = nums.length - 1, ans = -1;
      while (l <= r) {
        int mid = (l + r) >> 1;
        if (nums[mid] == target) {
          ans = mid;
          if (first) r = mid - 1;
          else l = mid + 1;
        } else if (nums[mid] < target) l = mid + 1;
        else r = mid - 1;
      }
      return ans;
    }
    return [findBound(true), findBound(false)];
  }
}