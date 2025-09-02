function threeSumClosest(nums: number[], target: number): number {
    nums.sort((a, b) => a - b);
    let n = nums.length, closestSum = nums[0] + nums[1] + nums[2];
    for (let i = 0; i < n - 2; i++) {
        let left = i + 1, right = n - 1;
        while (left < right) {
            let currSum = nums[i] + nums[left] + nums[right];
            if (currSum === target) return currSum;
            if (Math.abs(currSum - target) < Math.abs(closestSum - target)) {
                closestSum = currSum;
            }
            if (currSum < target) left++;
            else right--;
        }
    }
    return closestSum;
}