impl Solution {
    pub fn remove_element(nums: &mut Vec<i32>, val: i32) -> i32 {
        let mut n = nums.len();
        let mut i = 0usize;
        while i < n {
            if nums[i] == val {
                nums[i] = nums[n - 1];
                n -= 1;
            } else {
                i += 1;
            }
        }
        n as i32
    }
}