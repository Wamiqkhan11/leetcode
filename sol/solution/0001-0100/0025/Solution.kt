/**
 * Example:
 * var li = ListNode(5)
 * var v = li.`val`
 * Definition for singly-linked list.
 * class ListNode(var `val`: Int) {
 *     var next: ListNode? = null
 * }
 */
class Solution {
    fun reverseKGroup(head: ListNode?, k: Int): ListNode? {
        var curr = head
        var count = 0
        while (curr != null && count < k) {
            curr = curr.next
            count++
        }
        if (count == k) {
            val reversedHead = reverseLinkedList(head, k)
            // Recursively process the remaining list
            head?.next = reverseKGroup(curr, k)
            return reversedHead
        }
        return head
    }
    private fun reverseLinkedList(head: ListNode?, k: Int): ListNode? {
        var prev: ListNode? = null
        var curr = head
        var remainingK = k
        while (remainingK > 0 && curr != null) {
            val next = curr.next
            curr.next = prev
            prev = curr
            curr = next
            remainingK--
        }
        return prev
    }
}