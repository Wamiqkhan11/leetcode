public class Solution {
    public int[] SearchRange(int[] nums, int target) {
        return new int[] { FindBound(nums, target, true), FindBound(nums, target, false) };
    }
    private int FindBound(int[] nums, int target, bool first) {
        int l = 0, r = nums.Length - 1, ans = -1;
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
}