/**
 * Definition for singly-linked list.
 * class ListNode(_x: Int = 0, _next: ListNode = null) {
 *   var next: ListNode = _next
 *   var x: Int = _x
 * }
 */
object Solution {
    def reverseKGroup(head: ListNode, k: Int): ListNode = {
        var curr: ListNode = head
        var count: Int = 0
        while (curr != null && count < k) {
            curr = curr.next
            count += 1
        }
        if (count == k) {
            val reversedHead: ListNode = reverseLinkedList(head, k)
            // Recursively process the remaining list
            head.next = reverseKGroup(curr, k)
            return reversedHead
        }
        head
    }
    def reverseLinkedList(head: ListNode, k: Int): ListNode = {
        var prev: ListNode = null
        var curr: ListNode = head
        var remainingK: Int = k
        while (remainingK > 0 && curr != null) {
            val next: ListNode = curr.next
            curr.next = prev
            prev = curr
            curr = next
            remainingK -= 1
        }
        prev
    }
}