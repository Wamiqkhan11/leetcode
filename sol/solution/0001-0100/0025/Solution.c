/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* reverseLinkedList(struct ListNode* head, int k) {
    struct ListNode* prev = NULL;
    struct ListNode* curr = head;
    while (k > 0) {
        struct ListNode* next = curr->next;
        curr->next = prev;
        prev = curr;
        curr = next;
        k--;
    }
    return prev;
}
struct ListNode* reverseKGroup(struct ListNode* head, int k) {
    struct ListNode* curr = head;
    int count = 0;
    while (curr != NULL && count < k) {
        curr = curr->next;
        count++;
    }
    if (count == k) {
        struct ListNode* reversedHead = reverseLinkedList(head, k);
        head->next = reverseKGroup(curr, k);
        return reversedHead;
    }
    return head;
}