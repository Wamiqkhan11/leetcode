/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
    ListNode? swapPairs(ListNode? head) {
        if (head == null || head.next == null) return head;
        final dummy = ListNode(0, head);
        ListNode? prev = dummy;
        while (prev!.next != null && prev.next!.next != null) {
            final first = prev.next!;
            final second = first.next!;
            first.next = second.next;
            second.next = first;
            prev.next = second;
            prev = first;
        }
        return dummy.next;
    }
}