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

function reverseKGroup(head: ListNode | null, k: number): ListNode | null {
    let curr: ListNode | null = head;
    let count: number = 0;
    while (curr !== null && count < k) {
        curr = curr.next;
        count++;
    }
    if (count === k) {
        const reversedHead: ListNode | null = reverseLinkedList(head, k);
        if (head !== null) {
            head.next = reverseKGroup(curr, k);
        }
        return reversedHead;
    }
    return head;
}
function reverseLinkedList(head: ListNode | null, k: number): ListNode | null {
    let prev: ListNode | null = null;
    let curr: ListNode | null = head;
    while (k > 0 && curr !== null) {
        const next: ListNode | null = curr.next;
        curr.next = prev;
        prev = curr;
        curr = next;
        k--;
    }
    return prev;
}