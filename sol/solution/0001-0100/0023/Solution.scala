/**
 * Definition for singly-linked list.
 * class ListNode(_x: Int = 0, _next: ListNode = null) {
 *   var next: ListNode = _next
 *   var x: Int = _x
 * }
 */
object Solution {
    def merge2(ln1: ListNode, ln2: ListNode): ListNode = {
        if (ln1 == null && ln2 == null) {
            null
        } else if (ln1 == null) {
            ln2
        } else if (ln2 == null) {
            ln1
        } else {
            var c1 = ln1
            var c2 = ln2
            var head: ListNode = null
            var tail: ListNode = null
            while (c1 != null && c2 != null) {
                var nextNode: ListNode = null
                if (c1.x < c2.x) {
                    nextNode = c1
                    c1 = c1.next
                    nextNode.next = null
                } else {
                    nextNode = c2
                    c2 = c2.next
                    nextNode.next = null
                }
                if (head == null && tail == null) {
                    head = nextNode
                    tail = nextNode
                } else {
                    tail.next = nextNode
                    tail = nextNode
                }
            }
            if (c1 != null) {
                tail.next = c1
            } else if (c2 != null) {
                tail.next = c2
            }
            head
        }
    }
    def mergeKLists(lists: Array[ListNode]): ListNode = {
        var numListsRemaining = lists.length
        while (numListsRemaining > 1) {
            var ptr1 = 0
            var ptr2 = (numListsRemaining + 1) / 2
            while (ptr2 < numListsRemaining) {
                val l1 = lists(ptr1)
                val l2 = lists(ptr2)
                val merged = merge2(l1, l2)
                lists(ptr1) = merged
                ptr1 += 1
                ptr2 += 1
            }
            numListsRemaining = (numListsRemaining + 1) / 2
        }
        if (numListsRemaining == 1) {
            lists(0)
        } else {
            null
        }
    }
}