# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
  curr = head
  count = 0
  while curr != nil && count < k
    curr = curr.next
    count += 1
  end
  if count == k
    reversed_head = reverse_linked_list(head, k)
    head.next = reverse_k_group(curr, k)
    return reversed_head
  end
  head
end
def reverse_linked_list(head, k)
  prev = nil
  curr = head
  while k > 0 && curr != nil
    next_node = curr.next
    curr.next = prev
    prev = curr
    curr = next_node
    k -= 1
  end
  prev
end