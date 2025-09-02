# [**16. 3Sum Closest**](https://leetcode.com/problems/3sum-closest/description/)

Given an integer array `nums` of length `n` and an integer `target`, find three integers in `nums` such that the sum is closest to `target`.<br>
Return the sum of the three integers.

You may assume that each input would have exactly one solution.

#### **Example 1:**
```md
Input: nums = [-1,2,1,-4], target = 1
Output: 2
Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
```

#### **Example 2:**
```md
Input: nums = [0,1,1]
Output: []
Explanation: The only possible triplet does not sum up to 0.
```

#### **Example 3:**
```md
Input: nums = [0,0,0], target = 1
Output: 0
Explanation: The sum that is closest to the target is 0. (0 + 0 + 0 = 0).
```

#### **Constraints:**
> - `3 <= nums.length <= 500`
> - `-1000 <= nums[i] <= 1000`
> - `-10⁴ <= target <= 10⁴`