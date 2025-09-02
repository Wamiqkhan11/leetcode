impl Solution {
    pub fn three_sum_closest(nums: Vec<i32>, target: i32) -> i32 {
        let mut nums = nums;
        nums.sort();
        let n = nums.len();
        let mut closest_sum = nums[0] + nums[1] + nums[2];
        for i in 0..n-2 {
            let mut left = i + 1;
            let mut right = n - 1;
            while left < right {
                let curr_sum = nums[i] + nums[left] + nums[right];
                if curr_sum == target {
                    return curr_sum;
                }
                if (curr_sum - target).abs() < (closest_sum - target).abs() {
                    closest_sum = curr_sum;
                }
                if curr_sum < target {
                    left += 1;
                } else {
                    right -= 1;
                }
            }
        }
        closest_sum
    }
}