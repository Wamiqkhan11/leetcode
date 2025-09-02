/**
 * Definition for singly-linked list.
 * class ListNode(_x: Int = 0, _next: ListNode = null) {
 *   var next: ListNode = _next
 *   var x: Int = _x
 * }
 */
object Solution {
    def removeNthFromEnd(head: ListNode, n: Int): ListNode = {
        var size = 0
        var iter = head
        while (iter != null) {
            iter = iter.next
            size += 1
        }
        var nth = size - n
        var i = 0
        iter = head
        while (i < nth - 1) {
            i += 1
            iter = iter.next
        }
        if (nth == 0) head.next
        else {
            iter.next = iter.next.next
            head
        }
    }
}