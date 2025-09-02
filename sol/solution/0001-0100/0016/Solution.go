func threeSumClosest(nums []int, target int) int {
    sort.Ints(nums)
    n := len(nums)
    closestSum := nums[0] + nums[1] + nums[2]
    for i := 0; i < n-2; i++ {
        left, right := i+1, n-1
        for left < right {
            currSum := nums[i] + nums[left] + nums[right]
            if currSum == target {
                return currSum
            }
            if abs(currSum-target) < abs(closestSum-target) {
                closestSum = currSum
            }
            if currSum < target {
                left++
            } else {
                right--
            }
        }
    }
    return closestSum
}
func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}