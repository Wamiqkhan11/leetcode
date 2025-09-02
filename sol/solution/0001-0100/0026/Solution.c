int removeDuplicates(int* nums, int numsSize) {
	if (numsSize == 0) return 0;
	int write = 1;
	for (int read = 1; read < numsSize; ++read) {
		if (nums[read] != nums[read - 1]) {
			nums[write++] = nums[read];
		}
	}
	return write;
}