object Solution {
    def removeDuplicates(nums: Array[Int]): Int = {
       var i = 0
       var j = 1
       while(j<nums.length){
        if(nums(i) < nums(j)) {
            nums(i+1) = nums(j)
            i+=1
        }
        j+=1
       }
       i+1
    }
}