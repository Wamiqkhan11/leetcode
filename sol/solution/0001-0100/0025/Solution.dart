/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? reverseKGroup(ListNode? head, int k) {
    ListNode? curr = head;
    int count = 0;
    while (curr != null && count < k) {
      curr = curr.next;
      count++;
    }
    if (count == k) {
      final reversedHead = reverseLinkedList(head, k);
      head?.next = reverseKGroup(curr, k);
      return reversedHead;
    }
    return head;
  }
  ListNode? reverseLinkedList(ListNode? head, int k) {
    ListNode? prev = null;
    ListNode? curr = head;
    int remainingK = k;
    while (remainingK > 0 && curr != null) {
      final next = curr.next;
      curr.next = prev;
      prev = curr;
      curr = next;
      remainingK--;
    }
    return prev;
  }
}