/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* swapPairs(struct ListNode* head) {
    struct ListNode dummy;
    dummy.next = head;
    struct ListNode* curr = &dummy;
    while (curr->next && curr->next->next) {
        struct ListNode* first = curr->next;
        struct ListNode* second = curr->next->next;
        first->next = second->next;
        second->next = first;
        curr->next = second;
        curr = first;
    }
    return dummy.next;
}