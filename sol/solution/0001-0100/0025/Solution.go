/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func reverseKGroup(head *ListNode, k int) *ListNode {
    curr := head
    count := 0
    for curr != nil && count < k {
        curr = curr.Next
        count++
    }
    if count == k {
        reversedHead := reverseLinkedList(head, k)
        head.Next = reverseKGroup(curr, k)
        return reversedHead
    }
    return head
}
func reverseLinkedList(head *ListNode, k int) *ListNode {
    var prev *ListNode = nil
    curr := head
    for k > 0 && curr != nil {
        next := curr.Next
        curr.Next = prev
        prev = curr
        curr = next
        k--
    }
    return prev
}