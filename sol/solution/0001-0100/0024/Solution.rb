# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
    if head.nil? || head.next.nil?
        return head
    end
    dummy = ListNode.new(0, head)
    prev = dummy
    while prev.next && prev.next.next
        first = prev.next
        second = first.next
        first.next = second.next
        second.next = first
        prev.next = second
        prev = first
    end
    dummy.next
end