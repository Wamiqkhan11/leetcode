func searchRange(nums []int, target int) []int {
    findBound := func(first bool) int {
        l, r, ans := 0, len(nums)-1, -1
        for l <= r {
            mid := (l + r) / 2
            if nums[mid] == target {
                ans = mid
                if first {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            } else if nums[mid] < target {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return ans
    }
    return []int{findBound(true), findBound(false)}
}