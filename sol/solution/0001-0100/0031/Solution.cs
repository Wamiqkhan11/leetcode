public class Solution {
    public void NextPermutation(int[] nums) {
        int n = nums.Length, i = n - 2;
        while (i >= 0 && nums[i] >= nums[i + 1]) i--;
        if (i >= 0) {
            int j = n - 1;
            while (nums[j] <= nums[i]) j--;
            (nums[i], nums[j]) = (nums[j], nums[i]);
        }
        Array.Reverse(nums, i + 1, n - i - 1);
    }
}