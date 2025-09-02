object Solution {
    def fourSum(nums: Array[Int], target: Int): List[List[Int]] = {
        val result = scala.collection.mutable.ListBuffer[List[Int]]()
        val n = nums.length
        if (n < 4) return result.toList
        val sorted = nums.sorted
        for (i <- 0 until n - 3) {
            if (i > 0 && sorted(i) == sorted(i - 1)) {}
            else {
                for (j <- i + 1 until n - 2) {
                    if (j > i + 1 && sorted(j) == sorted(j - 1)) {}
                    else {
                        var left = j + 1
                        var right = n - 1
                        while (left < right) {
                            val sum = sorted(i).toLong + sorted(j) + sorted(left) + sorted(right)
                            if (sum == target) {
                                result += List(sorted(i), sorted(j), sorted(left), sorted(right))
                                while (left < right && sorted(left) == sorted(left + 1)) left += 1
                                while (left < right && sorted(right) == sorted(right - 1)) right -= 1
                                left += 1
                                right -= 1
                            } else if (sum < target) left += 1
                            else right -= 1
                        }
                    }
                }
            }
        }
        result.toList
    }
}