/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* mergeTwoLists(struct ListNode* list1, struct ListNode* list2) {
    struct ListNode* merged = NULL;
    struct ListNode** lastPtr = &merged;
    while (list1 && list2) {
        struct ListNode* newNode = malloc(sizeof(struct ListNode));
        if (!newNode) {
            return NULL;
        }
        if (list1->val < list2->val) {
            newNode->val = list1->val;
            list1 = list1->next;
        } else {
            newNode->val = list2->val;
            list2 = list2->next;
        }
        newNode->next = NULL;
        *lastPtr = newNode;
        lastPtr = &newNode->next;
    }
    *lastPtr = list1 ? list1 : list2;
    return merged;
}