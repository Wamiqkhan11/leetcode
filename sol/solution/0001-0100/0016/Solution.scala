object Solution {
    def threeSumClosest(nums: Array[Int], target: Int): Int = {
        val sorted = nums.sorted
        val n = nums.length
        var closestSum = sorted(0) + sorted(1) + sorted(2)
        var found = false
        var result = closestSum
        var i = 0
        while (i < n - 2 && !found) {
            var left = i + 1
            var right = n - 1
            while (left < right && !found) {
                val currSum = sorted(i) + sorted(left) + sorted(right)
                if (currSum == target) {
                    result = currSum
                    found = true
                } else {
                    if (Math.abs(currSum - target) < Math.abs(closestSum - target)) {
                        closestSum = currSum
                    }
                    if (currSum < target) left += 1
                    else right -= 1
                }
            }
            i += 1
        }
        if (found) result else closestSum
    }
}