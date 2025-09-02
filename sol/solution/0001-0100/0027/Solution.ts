function removeElement(nums: number[], val: number): number {
  let n = nums.length, i = 0;
  while (i < n) {
    if (nums[i] === val) {
      nums[i] = nums[n - 1];
      n--;
    } else {
      i++;
    }
  }
  return n;
}