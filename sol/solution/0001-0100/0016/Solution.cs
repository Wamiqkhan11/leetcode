public class Solution {
    public int ThreeSumClosest(int[] nums, int target) {
        Array.Sort(nums);
        int n = nums.Length, closestSum = nums[0] + nums[1] + nums[2];
        for (int i = 0; i < n - 2; i++) {
            int left = i + 1, right = n - 1;
            while (left < right) {
                int currSum = nums[i] + nums[left] + nums[right];
                if (currSum == target) return currSum;
                if (Math.Abs(currSum - target) < Math.Abs(closestSum - target)) {
                    closestSum = currSum;
                }
                if (currSum < target) left++;
                else right--;
            }
        }
        return closestSum;
    }
}