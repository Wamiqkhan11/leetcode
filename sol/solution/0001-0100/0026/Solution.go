func removeDuplicates(nums []int) int {
    if len(nums) == 0 {
        return 0
    }
    write := 1
    for i := 1; i < len(nums); i++ {
        if nums[i] != nums[write-1] {
            nums[write] = nums[i]
            write++
        }
    }
    return write
}