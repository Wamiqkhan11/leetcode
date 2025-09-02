/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func mergeKLists(lists []*ListNode) *ListNode {
    if len(lists) == 0 {
        return nil
    }
    return mergeKListsHelper(lists, 0, len(lists)-1)
}
func mergeKListsHelper(lists []*ListNode, left, right int) *ListNode {
    if left == right {
        return lists[left]
    }
    mid := left + (right-left)/2
    l1 := mergeKListsHelper(lists, left, mid)
    l2 := mergeKListsHelper(lists, mid+1, right)
    return mergeTwoLists(l1, l2)
}
func mergeTwoLists(l1, l2 *ListNode) *ListNode {
    dummy := &ListNode{}
    current := dummy
    for l1 != nil && l2 != nil {
        if l1.Val < l2.Val {
            current.Next = l1
            l1 = l1.Next
        } else {
            current.Next = l2
            l2 = l2.Next
        }
        current = current.Next
    }
    if l1 != nil {
        current.Next = l1
    }
    if l2 != nil {
        current.Next = l2
    }
    return dummy.Next
}