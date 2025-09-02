/**
 * Definition for singly-linked list.
 * class ListNode(_x: Int = 0, _next: ListNode = null) {
 *   var next: ListNode = _next
 *   var x: Int = _x
 * }
 */
object Solution {
    def swapPairs(head: ListNode): ListNode = {
        if (head == null || head.next == null) return head
        val dummy = new ListNode(0, head)
        var prev: ListNode = dummy
        while (prev.next != null && prev.next.next != null) {
            val first = prev.next
            val second = first.next
            first.next = second.next
            second.next = first
            prev.next = second
            prev = first
        }
        dummy.next
    }
}