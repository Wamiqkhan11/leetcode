/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    ListNode? merged = ListNode();
    ListNode? current = merged;
    while (list1 != null && list2 != null) {
      if (list1.val < list2.val) {
        current?.next = list1;
        list1 = list1.next;
      } else {
        current?.next = list2;
        list2 = list2.next;
      }
      current = current?.next;
    }
    current?.next = list1 ?? list2;
    return merged?.next;
  }
}