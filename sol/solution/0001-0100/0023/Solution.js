/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode[]} lists
 * @return {ListNode}
 */
var mergeKLists = function(lists) {
    if (!lists || lists.length === 0) {
        return null;
    }
    return mergeKListsHelper(lists, 0, lists.length - 1);
};
var mergeKListsHelper = function(lists, left, right) {
    if (left === right) {
        return lists[left];
    }
    var mid = Math.floor((left + right) / 2);
    var l1 = mergeKListsHelper(lists, left, mid);
    var l2 = mergeKListsHelper(lists, mid + 1, right);
    return mergeTwoLists(l1, l2);
};
var mergeTwoLists = function(l1, l2) {
    var dummy = new ListNode();
    var current = dummy;
    while (l1 !== null && l2 !== null) {
        if (l1.val < l2.val) {
            current.next = l1;
            l1 = l1.next;
        } else {
            current.next = l2;
            l2 = l2.next;
        }
        current = current.next;
    }
    current.next = l1 !== null ? l1 : l2;
    return dummy.next;
};