function searchRange(nums: number[], target: number): number[] {
    function findBound(first: boolean): number {
        let l = 0, r = nums.length - 1, ans = -1;
        while (l <= r) {
            let mid = Math.floor((l + r) / 2);
            if (nums[mid] === target) {
                ans = mid;
                if (first) r = mid - 1;
                else l = mid + 1;
            } else if (nums[mid] < target) l = mid + 1;
            else r = mid - 1;
        }
        return ans;
    }
    return [findBound(true), findBound(false)];
}