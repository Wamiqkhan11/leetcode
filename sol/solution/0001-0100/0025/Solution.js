/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @param {number} k
 * @return {ListNode}
 */
var reverseKGroup = function(head, k) {
    let curr = head;
    let count = 0;
    while (curr !== null && count < k) {
        curr = curr.next;
        count++;
    }
    if (count === k) {
        const reversedHead = reverseLinkedList(head, k);
        head.next = reverseKGroup(curr, k);
        return reversedHead;
    }
    return head;
};
/**
 * Reverses a linked list of size k and returns the new head.
 * @param {ListNode} head
 * @param {number} k
 * @return {ListNode}
 */
function reverseLinkedList(head, k) {
    let prev = null;
    let curr = head;
    while (k > 0) {
        const next = curr.next;
        curr.next = prev;
        prev = curr;
        curr = next;
        k--;
    }
    return prev;
}