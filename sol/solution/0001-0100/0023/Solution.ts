/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */
function mergeKLists(lists: Array<ListNode | null>): ListNode | null {
    if (!lists || lists.length === 0) {
        return null;
    }
    return mergeKListsHelper(lists, 0, lists.length - 1);
};
function mergeKListsHelper(lists: Array<ListNode | null>, left: number, right: number): ListNode | null {
    if (left === right) {
        return lists[left];
    }
    const mid = Math.floor((left + right) / 2);
    const l1 = mergeKListsHelper(lists, left, mid);
    const l2 = mergeKListsHelper(lists, mid + 1, right);
    return mergeTwoLists(l1, l2);
};
function mergeTwoLists(l1: ListNode | null, l2: ListNode | null): ListNode | null {
    const dummy = new ListNode();
    let current = dummy;
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