# [**34. Find First and Last Position of Element in Sorted Array**](https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/description/)

Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given `target` value.<br>
If `target` is not found in the array, return `[-1, -1]`.

You must write an algorithm with `O(log n)` runtime complexity.

#### **Example 1:**
```md
Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]
```

#### **Example 2:**
```md
Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]
```

#### **Example 3:**
```md
Input: nums = [], target = 0
Output: [-1,-1]
```

#### **Constraints:**
> - `0 <= nums.length <= 10⁵`
> - `-10⁹ <= nums[i] <= 10⁹`
> - `nums` is a non-decreasing array.
> - `-10⁹ <= target <= 10⁹`