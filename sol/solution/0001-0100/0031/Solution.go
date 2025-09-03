func nextPermutation(nums []int) {
    i := len(nums) - 2
    for i >= 0 && nums[i] >= nums[i+1] {
        i--
    }
    if i >= 0 {
        j := len(nums) - 1
        for nums[j] <= nums[i] {
            j--
        }
        nums[i], nums[j] = nums[j], nums[i]
    }
    reverse(nums[i+1:])
}
func reverse(nums []int) {
    l, r := 0, len(nums)-1
    for l < r {
        nums[l], nums[r] = nums[r], nums[l]
        l++
        r--
    }
}