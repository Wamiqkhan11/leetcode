/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? removeNthFromEnd(ListNode? head, int n) {
    ListNode dummy = ListNode(0, head);
    ListNode? first = dummy;
    ListNode second = dummy;
    for (int i = 0; i <= n; i++) {
      first = first?.next;
    }
    while (first != null) {
      first = first.next;
      second = second.next!;
    }
    second.next = second.next?.next;
    return dummy.next;
  }
}