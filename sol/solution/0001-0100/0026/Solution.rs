impl Solution {
    pub fn remove_duplicates(nums: &mut Vec<i32>) -> i32 {
        if nums.is_empty() {
            return 0;
        }
        let mut write = 1;
        for i in 1..nums.len() {
            if nums[i] != nums[write - 1] {
                nums[write] = nums[i];
                write += 1;
            }
        }
        write as i32
    }
}