object Solution {
  def removeElement(nums: Array[Int], v: Int): Int = {
    var n = nums.length
    var i = 0
    while (i < n) {
      if (nums(i) == v) {
        nums(i) = nums(n - 1)
        n -= 1
      } else {
        i += 1
      }
    }
    n
  }
}