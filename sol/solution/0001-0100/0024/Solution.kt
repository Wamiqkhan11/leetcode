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
    fun swapPairs(head: ListNode?): ListNode? {
        if (head?.next == null) return head
        val dummy = ListNode(0)
        dummy.next = head
        var prev: ListNode? = dummy
        while (prev?.next != null && prev.next?.next != null) {
            val first = prev.next
            val second = first?.next
            first?.next = second?.next
            second?.next = first
            prev.next = second
            prev = first
        }
        return dummy.next
    }
}