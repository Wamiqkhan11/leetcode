# [**35. Search Insert Position**](https://leetcode.com/problems/search-insert-position/description/)

Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

You must write an algorithm with `O(log n)` runtime complexity.

#### **Example 1:**
```md
Input: nums = [1,3,5,6], target = 5
Output: 2
```

#### **Example 2:**
```md
Input: nums = [1,3,5,6], target = 2
Output: 1
```

#### **Example 3:**
```md
Input: nums = [1,3,5,6], target = 7
Output: 4
```

#### **Constraints:**
> - `1 <= nums.length <= 10⁴`
> - `-10⁴ <= nums[i] <= 10⁴`
> - `nums` contains **distinct** values sorted in **ascending** order.
> - `-10⁴ <= target <= 10⁴`