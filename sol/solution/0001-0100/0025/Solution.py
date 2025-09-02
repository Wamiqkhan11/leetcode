# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reverseKGroup(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        curr = head
        count = 0
        while curr and count < k:
            curr = curr.next
            count += 1
        if count == k:
            reversed_head = self.reverseLinkedList(head, k)
            head.next = self.reverseKGroup(curr, k)
            return reversed_head
        return head
    def reverseLinkedList(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        prev = None
        curr = head
        while k > 0:
            next_node = curr.next
            curr.next = prev
            prev = curr
            curr = next_node
            k -= 1
        return prev