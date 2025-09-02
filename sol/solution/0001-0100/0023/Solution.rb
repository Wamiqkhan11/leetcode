# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
    return nil if lists.nil? || lists.empty?
    min_heap = []
    lists.each_with_index do |list, index|
        min_heap.push([list.val, index]) if list
    end
    min_heap.sort_by!(&:first)
    dummy = ListNode.new
    current = dummy
    while !min_heap.empty?
        val, index = min_heap.shift
        current.next = ListNode.new(val)
        current = current.next
        lists[index] = lists[index].next if lists[index]
        if lists[index]
            min_heap.push([lists[index].val, index])
            min_heap.sort_by!(&:first)
        end
    end
    dummy.next
end