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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let dummy = ListNode(0, head)
        var prev = dummy
        while prev.next != nil && prev.next?.next != nil {
            let first = prev.next
            let second = first?.next
            first?.next = second?.next
            second?.next = first
            prev.next = second
            prev = first!
        }
        return dummy.next
    }
}