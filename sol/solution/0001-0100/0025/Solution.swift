/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var curr = head
        var count = 0
        while curr != nil && count < k {
            curr = curr?.next
            count += 1
        }
        if count == k {
            let reversedHead = reverseLinkedList(head, k)
            head?.next = reverseKGroup(curr, k)
            return reversedHead
        }
        return head
    }
    private func reverseLinkedList(_ head: ListNode?, _ k: Int) -> ListNode? {
        var prev: ListNode? = nil
        var curr = head
        var remainingK = k
        while remainingK > 0 && curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
            remainingK -= 1
        }
        return prev
    }
}