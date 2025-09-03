impl Solution {
    pub fn search(nums: Vec<i32>, target: i32) -> i32 {
        let (mut l, mut r) = (0, nums.len() as i32 - 1);
        while l <= r {
            let mid = l + (r - l) / 2;
            if nums[mid as usize] == target { return mid; }
            if nums[l as usize] <= nums[mid as usize] {
                if nums[l as usize] <= target && target < nums[mid as usize] {
                    r = mid - 1;
                } else {
                    l = mid + 1;
                }
            } else {
                if nums[mid as usize] < target && target <= nums[r as usize] {
                    l = mid + 1;
                } else {
                    r = mid - 1;
                }
            }
        }
        -1
    }
}