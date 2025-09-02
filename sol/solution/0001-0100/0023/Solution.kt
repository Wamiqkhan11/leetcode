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
    fun mergeKLists(lists: Array<ListNode?>): ListNode? {
        val pq = java.util.PriorityQueue<ListNode>(compareBy { it.`val` })
        for (node in lists) {
            if (node != null) pq.add(node)
        }
        val dummy = ListNode(0)
        var curr = dummy
        while (pq.isNotEmpty()) {
            val node = pq.poll()
            curr.next = node
            curr = curr.next!!
            if (node.next != null) pq.add(node.next)
        }
        return dummy.next
    }
}