impl Solution {
    pub fn search_range(nums: Vec<i32>, target: i32) -> Vec<i32> {
        fn find_bound(nums: &Vec<i32>, target: i32, first: bool) -> i32 {
            let (mut l, mut r) = (0, nums.len() as i32 - 1);
            let mut ans = -1;
            while l <= r {
                let mid = l + (r - l) / 2;
                if nums[mid as usize] == target {
                    ans = mid;
                    if first { r = mid - 1; } else { l = mid + 1; }
                } else if nums[mid as usize] < target {
                    l = mid + 1;
                } else {
                    r = mid - 1;
                }
            }
            ans
        }
        vec![find_bound(&nums, target, true), find_bound(&nums, target, false)]
    }
}